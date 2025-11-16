// lib/features/game/presentation/pages/game_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../../core/services/pandora_service.dart';
import '../../../pandora/presentation/pages/session_stats_page.dart';
import '../../../subscription/presentation/pages/subscription_page.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/rating_dialog.dart';
import '../../../../core/services/feedback_service.dart';
import '../widgets/question_card.dart';
import '../widgets/reaction_buttons.dart';
import '../widgets/question_picker.dart';



class GamePage extends ConsumerStatefulWidget {
  final String gameMode;
  final String category;
  final bool isDarkMode;
  final List<String>? customQuestions;
  final String? sessionId;
  final bool? isHost;

  const GamePage({
    super.key,
    required this.gameMode,
    required this.category,
    required this.isDarkMode,
    this.customQuestions,
    this.sessionId,
    this.isHost,
  });

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  final supabaseService = SupabaseService();
  final pandoraService = PandoraService();
  final CardSwiperController controller = CardSwiperController();
  String? _loadedLanguageCode;
  bool _favoritesLoaded = false;
  bool _lastKnownPremiumStatus = false; // Track premium status
  List<String> allQuestions = [];
  List<String> displayedQuestions = [];
  int currentIndex = 0;
  bool isLoading = true;
  String? logoUrl;
  
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  
  bool isPandoraMode = false;
  bool isHostMode = false;
  
  Map<String, int> currentReactions = {
    'laugh': 0,
    'shock': 0,
    'heart': 0,
    'fire': 0,
  };
  String? mySelectedReaction;
  RealtimeChannel? sessionChannel;
  RealtimeChannel? reactionsChannel;
  String? myParticipantId;
  
  Set<String> favoriteQuestions = {};

  @override
  void initState() {
    super.initState();
    isPandoraMode = widget.gameMode.toLowerCase() == 'pandora' && widget.sessionId != null;
    isHostMode = widget.isHost ?? false;

    _lastKnownPremiumStatus = ref.read(unlockProvider).isPremium; // Initialize premium status

    // Listen for premium status changes and reload questions automatically
    ref.listenManual(unlockProvider.select((state) => state.isPremium), (previous, next) {
      if (previous == false && next == true && !isLoading) {
        debugPrint('🎉 Premium status changed! Reloading questions to get all 75...');
        _lastKnownPremiumStatus = true;
        _loadQuestions();

        // Reload the UI to remove lock icons, update limits, etc.
        if (mounted) {
          setState(() {});
        }
      }
    });

    _loadQuestions();
    _loadAd();
    _loadLogo();

    if (isPandoraMode && !isHostMode) {
      _subscribeToPandoraSync();
    }

    if (isPandoraMode) {
      _getMyParticipantId();
      _subscribeToReactions();
      _loadReactionsForCurrentQuestion();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_favoritesLoaded && !isPandoraMode) {
      _favoritesLoaded = true;
      _loadFavoriteQuestions();
    }

    String currentLanguageCode = 'en';
    try {
      currentLanguageCode = Localizations.localeOf(context).languageCode;
    } catch (e) {
      // Context not ready
    }

    if (_loadedLanguageCode != null &&
        _loadedLanguageCode != currentLanguageCode &&
        !isLoading) {
      debugPrint('🌍 Language changed from $_loadedLanguageCode to $currentLanguageCode - reloading');
      _loadQuestions();
    }
  }

  // CRITICAL FIX: Extract duplicate subscription refresh logic
  Future<void> _handleSubscriptionResult(bool? result, {VoidCallback? onSuccess}) async {
    debugPrint('🔄 Returned from subscription page, refreshing unlock manager...');
    await ref.read(unlockProvider.notifier).initialize();
    debugPrint('📊 Premium status after refresh: ${ref.read(unlockProvider).isPremium}');

    if (mounted && (result == true || ref.read(unlockProvider).isPremium)) {
      final savedIndex = currentIndex;

      debugPrint('🔄 User subscribed! Reloading questions...');
      debugPrint('📊 Before reload: ${displayedQuestions.length} questions');

      await _loadQuestions();

      debugPrint('📊 After reload: ${displayedQuestions.length} questions');

      if (mounted) {
        setState(() {
          currentIndex = savedIndex;
          _lastKnownPremiumStatus = true;
        });

        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '🎉 ${l10n.premiumActivated} All ${displayedQuestions.length} questions unlocked!',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );

        onSuccess?.call();
      }
    }
  }

  Future<void> _loadFavoriteQuestions() async {
    if (isPandoraMode) return;
    
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return;
      
      final deckResponse = await Supabase.instance.client
          .from('custom_decks')
          .select('id')
          .eq('user_id', userId)
          .eq('deck_name', 'Favorites')
          .maybeSingle();
      
      if (deckResponse == null) return;
      
      final deckId = deckResponse['id'];
      
      final questionsResponse = await Supabase.instance.client
          .from('custom_questions')
          .select('question_text')
          .eq('deck_id', deckId);
      
      setState(() {
        favoriteQuestions = (questionsResponse as List)
            .map((item) => item['question_text'] as String)
            .toSet();
      });
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }
  
  Future<void> _toggleFavorite(String question) async {
    if (isPandoraMode) return;
    
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return;
      
      var deckResponse = await Supabase.instance.client
          .from('custom_decks')
          .select('id')
          .eq('user_id', userId)
          .eq('deck_name', 'Favorites')
          .maybeSingle();
      
      String deckId;
      
      if (deckResponse == null) {
        final newDeckResponse = await Supabase.instance.client
            .from('custom_decks')
            .insert({
          'user_id': userId,
          'deck_name': 'Favorites',
        })
            .select('id')
            .single();
        
        deckId = newDeckResponse['id'];
      } else {
        deckId = deckResponse['id'];
      }
      
      final isFavorite = favoriteQuestions.contains(question);
      
      if (isFavorite) {
        await Supabase.instance.client
            .from('custom_questions')
            .delete()
            .eq('deck_id', deckId)
            .eq('question_text', question);
        
        setState(() {
          favoriteQuestions.remove(question);
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from favorites'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.orange,
            ),
          );
        }
      } else {
        await Supabase.instance.client
            .from('custom_questions')
            .insert({
          'deck_id': deckId,
          'question_text': question,
        });
        
        setState(() {
          favoriteQuestions.add(question);
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to favorites'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('❌ Error toggling favorite: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error saving favorite'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  Future<void> _getMyParticipantId() async {
  try {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final userEmail = Supabase.instance.client.auth.currentUser?.email;
    
    debugPrint('🔍 Getting participant ID for user: $userId ($userEmail)');
    
    final participants = await pandoraService.getParticipants(widget.sessionId!);
    debugPrint('👥 Total participants: ${participants.length}');
    
    // Find participant by user_id (most reliable) or email as fallback
    final myParticipant = participants.firstWhere(
      (p) {
        // Try matching by user_id first (most reliable)
        if (userId != null && p['user_id'] == userId) {
          debugPrint('✅ Matched by user_id: ${p['display_name']}');
          return true;
        }
        
        // Fallback to email match
        if (userEmail != null && p['user_email'] == userEmail) {
          debugPrint('✅ Matched by email: ${p['display_name']}');
          return true;
        }
        
        // Fallback to host status
        if (p['is_host'] == true && isHostMode) {
          debugPrint('✅ Matched by host status: ${p['display_name']}');
          return true;
        }
        
        return false;
      },
      orElse: () {
        debugPrint('❌ ERROR: No matching participant found!');
        debugPrint('⚠️ User ID: $userId');
        debugPrint('⚠️ Available participants:');
        for (var p in participants) {
          debugPrint('   - ${p['display_name']}: user_id=${p['user_id']}, email=${p['user_email']}');
        }
        throw Exception('Current user is not a participant in this session');
      },
    );
    
    setState(() {
      myParticipantId = myParticipant['id'];
    });
    
    debugPrint('✅ My participant ID: $myParticipantId (${myParticipant['display_name']})');
  } catch (e) {
    debugPrint('❌ Error getting participant ID: $e');
    
    // Show error to user
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: Could not identify player. Please rejoin the session.'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
  
  void _subscribeToReactions() {
    reactionsChannel = pandoraService.subscribeToReactions(
      widget.sessionId!,
      () {
        _loadReactionsForCurrentQuestion();
      },
    );
  }
  
  Future<void> _loadReactionsForCurrentQuestion() async {
    if (!isPandoraMode || myParticipantId == null) return;
    
    try {
      final reactions = await pandoraService.getReactionsForQuestion(
        widget.sessionId!,
        currentIndex,
      );
      
      final myReaction = await pandoraService.getMyReaction(
        sessionId: widget.sessionId!,
        questionIndex: currentIndex,
        participantId: myParticipantId!,
      );
      
      debugPrint('📊 Loaded reactions: $reactions, my reaction: $myReaction');
      
      if (mounted) {
        setState(() {
          currentReactions = reactions;
          mySelectedReaction = myReaction;
        });
      }
    } catch (e) {
      debugPrint('❌ Error loading reactions: $e');
    }
  }
  
  Future<void> _addReaction(String reactionType) async {
    if (!isPandoraMode || myParticipantId == null) return;
    
    await pandoraService.addReaction(
      sessionId: widget.sessionId!,
      questionIndex: currentIndex,
      participantId: myParticipantId!,
      reactionType: reactionType,
    );
    
    // Update local state immediately
    setState(() {
      mySelectedReaction = reactionType;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _interstitialAd?.dispose();
    sessionChannel?.unsubscribe();
    reactionsChannel?.unsubscribe();
    super.dispose();
  }

  void _subscribeToPandoraSync() {
    debugPrint('🔌 [Player] Subscribing to database changes for sync');
    
    sessionChannel = pandoraService.subscribeToSession(
      widget.sessionId!,
      (session) {
        final newIndex = session['current_question_index'] as int?;
        final status = session['status'] as String?;
        
        if (status == 'ended' && mounted) {
          debugPrint('🎮 [Player] Game ended by host - navigating to stats');
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) _showGameEndDialog();
          });
          return;
        }
        
        if (newIndex != null && mounted) {
          debugPrint('📡 [Player] DB update - question index: $newIndex (current: $currentIndex)');
          
          // If host goes past the last question or back to 0 from the end, game is ending
          if (newIndex >= displayedQuestions.length || 
              (newIndex == 0 && currentIndex == displayedQuestions.length - 1)) {
            debugPrint('🎮 [Player] Game ending detected');
            Future.delayed(const Duration(milliseconds: 300), () {
              if (mounted) _showGameEndDialog();
            });
            return;
          }
          
          if (newIndex != currentIndex && newIndex >= 0 && newIndex < displayedQuestions.length) {
            debugPrint('✅ [Player] Syncing to question: $newIndex');
            
            setState(() {
              currentIndex = newIndex;
              mySelectedReaction = null;
            });
            
            controller.moveTo(newIndex);
            _loadReactionsForCurrentQuestion();
          }
        }
      },
    );
  }

  void _loadAd() {
    if (isPandoraMode) {
      debugPrint('Pandora mode - skipping ads for multiplayer experience');
      return;
    }

    final isPremiumNow = ref.read(unlockProvider).isPremium;
    if (isPremiumNow) {
      debugPrint('User is premium, skipping ad load');
      return;
    }

    debugPrint('Loading interstitial ad...');
    
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('Ad loaded successfully');
          _interstitialAd = ad;
          _isAdLoaded = true;
          
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('Ad dismissed');
              ad.dispose();
              _isAdLoaded = false;
              _loadAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('Ad failed to show: $error');
              ad.dispose();
              _isAdLoaded = false;
              _loadAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('Ad failed to load: $error');
          _isAdLoaded = false;
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) _loadAd();
          });
        },
      ),
    );
  }

  void _loadLogo() {
    setState(() {
      logoUrl = 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/AppIcon/AppIcon.png';
    });
  }

  Future<void> _loadQuestions() async {
    try {
      setState(() {
        isLoading = true;
      });

      if (widget.customQuestions != null && widget.customQuestions!.isNotEmpty) {
        debugPrint('✅ Using custom questions (Pandora/Personal mode)');
        setState(() {
          allQuestions = widget.customQuestions!;
          displayedQuestions = List.from(allQuestions);
          isLoading = false;
        });
        return;
      }

      String languageCode = 'da';
      try {
        languageCode = Localizations.localeOf(context).languageCode;
      } catch (e) {
        debugPrint('Using default language: English');
      }

      final questions = await supabaseService.getQuestions(
        widget.gameMode,
        widget.category,
        languageCode: languageCode,
      );

      if (!mounted) return;

      if (questions.isEmpty) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          allQuestions = [l10n.noQuestionsFoundMessage(widget.category, widget.gameMode)];
          displayedQuestions = List.from(allQuestions);
          isLoading = false;
          _loadedLanguageCode = languageCode;
        });
        return;
      }

      // Limit questions based on user's access level
      final questionLimit = ref.read(unlockProvider.notifier).getQuestionLimitForCategory(widget.gameMode, widget.category);
      final limitedQuestions = questions.take(questionLimit).toList();
      
      setState(() {
        allQuestions = questions; // Keep all for reference
        displayedQuestions = limitedQuestions; // Only show allowed questions
        isLoading = false;
        _loadedLanguageCode = languageCode;
      });

      debugPrint('✅ Loaded ${questions.length} questions, displaying ${limitedQuestions.length} (limit: $questionLimit) in $languageCode');
    } catch (e) {
      debugPrint('Error loading questions: $e');
      
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          allQuestions = [l10n.errorLoadingQuestions];
          displayedQuestions = List.from(allQuestions);
          isLoading = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.failedToLoadQuestions(e.toString()),
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  void _showAdOrPurchaseOption() {
  if (isPandoraMode) return;
  final isPremiumNow = ref.read(unlockProvider).isPremium;
  if (isPremiumNow) return;

  if (ref.read(unlockProvider.notifier).shouldShowAd()) {
    if (!mounted) return;
    
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: CustomDialog(
          isDarkMode: widget.isDarkMode,
          icon: Icons.play_circle_outline,
          iconColor: const Color(0xFF9C27B0),
          iconSize: 48,
          title: l10n.advertisement,
          contentWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              l10n.watchAdMessage,
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.4,
                color: widget.isDarkMode
                    ? Colors.white.withValues(alpha: 0.85)
                    : const Color(0xFF2D1B2E).withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          actions: [
            DialogButton(
              text: _isAdLoaded ? l10n.watchAd : l10n.adLoadingContinue,
              onPressed: () {
                Navigator.pop(context);
                
                if (_isAdLoaded && _interstitialAd != null) {
                  debugPrint('Showing ad...');
                  _interstitialAd!.show();
                  ref.read(unlockProvider.notifier).resetQuestionCount();
                } else {
                  debugPrint('Ad not ready, continuing without ad');
                  ref.read(unlockProvider.notifier).resetQuestionCount();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        l10n.adNotReady,
                        style: GoogleFonts.poppins(),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              isPrimary: false,
              isDarkMode: widget.isDarkMode,
              icon: Icons.play_arrow,
            ),
            const SizedBox(height: 12),
            DialogButton(
              text: l10n.goAdFree,
              onPressed: () async {
                final result = await Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
                  ),
                );

                await _handleSubscriptionResult(
                  result,
                  onSuccess: () {
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                );
              },
              isPrimary: true,
              isDarkMode: widget.isDarkMode,
              icon: Icons.stars,
            ),
          ],
        ),
      ),
    );
  }
}

  bool _onSwipe(
    int previousIndex,
    int? currentIndexNullable,
    CardSwiperDirection direction,
  ) {
    final newIndex = currentIndexNullable ?? previousIndex;
    debugPrint('🔄 Swiped: prev=$previousIndex, new=$newIndex, dir=$direction, total=${displayedQuestions.length}');
    
    if (isPandoraMode && !isHostMode) {
      debugPrint('🚫 [Player] Manual swiping blocked');
      return false;
    }
    
    // Check if we're ALREADY on the last question and swiping (any direction = forward)
    if (previousIndex == displayedQuestions.length - 1) {
      debugPrint('🎮 [Host] On last question ($previousIndex), swiping - ending game');
      // Check if this is a preview limit for locked category
        final currentPremiumStatus = ref.read(unlockProvider).isPremium;
        if (!isPandoraMode && !currentPremiumStatus &&
            ref.read(unlockProvider.notifier).isCategoryLocked(widget.gameMode, widget.category)) {
          debugPrint('🔒 Free user reached end of preview questions - showing premium dialog');
          _showPremiumCategoryDialog();
          return false;
        }
      if (isPandoraMode && isHostMode) {
        pandoraService.endSession(widget.sessionId!).then((_) {
          debugPrint('✅ [Host] Session ended, navigating to stats');
          if (mounted) _showGameEndDialog();
        });
      } else {
        _showGameEndDialog();
      }
      
      return false; // Block the swipe
    }
    
    // Normal swipe logic
    setState(() {
      currentIndex = newIndex;
      mySelectedReaction = null; // Clear selection when question changes
    });
    
    if (isPandoraMode && isHostMode) {
      _updateDatabaseIndex(newIndex);
    }
    
    _loadReactionsForCurrentQuestion();
    
    if (!isPandoraMode) {
      ref.read(unlockProvider.notifier).incrementQuestionCount();
      _showAdOrPurchaseOption();
    }
    
    return true;
  }

  Future<void> _updateDatabaseIndex(int index) async {
    try {
      await pandoraService.updateQuestionIndex(widget.sessionId!, index);
      debugPrint('💾 [Host] Updated database to index $index');
    } catch (e) {
      debugPrint('❌ [Host] Failed to update database: $e');
    }
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndexArg,
    CardSwiperDirection direction,
  ) {
    debugPrint('Undo: previous=$previousIndex, current=$currentIndexArg');
    
    setState(() {
      currentIndex = currentIndexArg;
      mySelectedReaction = null;
    });
    
    if (isPandoraMode && isHostMode) {
      _updateDatabaseIndex(currentIndexArg);
    }
    
    return true;
  }

void _showGameEndDialog() {
  if (!mounted) return;

  // For Pandora mode, ALWAYS go to stats page (both host and players)
  if (isPandoraMode) {
    debugPrint('🎉 [${isHostMode ? "Host" : "Player"}] Navigating to stats page');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SessionStatsPage(
          sessionId: widget.sessionId!,
          isDarkMode: widget.isDarkMode,
        ),
      ),
    );
    return;
  }

  final l10n = AppLocalizations.of(context)!;
  final isPremium = ref.read(unlockProvider).isPremium;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => PopScope(
      canPop: false,
      child: CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.emoji_events,
        iconColor: const Color(0xFFFFD700),
        iconSize: 56,
        title: l10n.thanksForPlaying,
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.hopeYouHadFun,
              style: GoogleFonts.poppins(
                fontSize: 16,
                height: 1.5,
                color: widget.isDarkMode
                    ? Colors.white.withValues(alpha: 0.85)
                    : const Color(0xFF2D1B2E).withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
            ),
            
            // Premium upsell for freemium users
            if (!isPremium) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFFF6B9D).withValues(alpha: 0.15),
                      const Color(0xFFFFD700).withValues(alpha: 0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.stars,
                      color: Color(0xFFFFD700),
                      size: 32,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.removeAdsForever,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.isDarkMode ? Colors.white : const Color(0xFF2D1B2E),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.premiumPriceMonthly,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: widget.isDarkMode 
                            ? Colors.white.withValues(alpha: 0.7)
                            : const Color(0xFF2D1B2E).withValues(alpha: 0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          DialogButton(
            text: l10n.playAgain,
            onPressed: () async {
              Navigator.of(context).pop(); // Close dialog
              
              // Reload questions with full access if premium
              await _loadQuestions();
              
              // Reset to start for fresh play
              setState(() {
                currentIndex = 0;
              });
              // No need to move controller - CardSwiper will rebuild with new data
            },
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
            icon: Icons.replay,
          ),
          const SizedBox(height: 12),
          
          // Show premium button for freemium users, otherwise show main menu
          if (!isPremium)
            DialogButton(
              text: l10n.getPremium,
              onPressed: () async {
                final result = await Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
                  ),
                );

                await _handleSubscriptionResult(
                  result,
                  onSuccess: () {
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                );

                // If user didn't subscribe, close dialog and return to category
                if (mounted && !ref.read(unlockProvider).isPremium && result != true) {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(true); // Close game page with refresh signal
                }
              },
              isPrimary: true,
              isDarkMode: widget.isDarkMode,
              icon: Icons.workspace_premium,
            )
          else
            DialogButton(
              text: l10n.mainMenu,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              isPrimary: true,
              isDarkMode: widget.isDarkMode,
              icon: Icons.home,
            ),
          
          // Additional main menu button for freemium (secondary position)
          if (!isPremium) ...[
            const SizedBox(height: 12),
            DialogButton(
              text: l10n.mainMenu,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              isPrimary: false,
              isDarkMode: widget.isDarkMode,
              icon: Icons.home,
            ),
          ],
        ],
      ),
    ),
  );
}

void _showPremiumCategoryDialog() {
  final l10n = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    barrierDismissible: false,  // Prevent dismissing by tapping outside
    builder: (context) => CustomDialog(
      isDarkMode: widget.isDarkMode,
      icon: Icons.lock_open,
      iconColor: const Color(0xFFFF6B9D),
      title: l10n.limitReached,
      content: l10n.previewLimit,
      actions: [
        DialogButton(
          text: l10n.mayBeLater,
          onPressed: () {
            // Close dialog and return to category selection
            Navigator.of(context).pop(); // Close dialog
            Navigator.of(context).pop(true); // Close game page with refresh signal
          },
          isPrimary: false,
          isDarkMode: widget.isDarkMode,
        ),
        const SizedBox(height: 12),
        DialogButton(
          text: l10n.subscribe,
          onPressed: () async {
            final result = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
              ),
            );

            await _handleSubscriptionResult(
              result,
              onSuccess: () {
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
            );

            // If user didn't subscribe, close dialog and return to category
            if (mounted && !ref.read(unlockProvider).isPremium && result != true) {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(true); // Close game page with refresh signal
            }
          },
          isPrimary: true,
          isDarkMode: widget.isDarkMode,
          icon: Icons.workspace_premium,
        ),
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    // CRITICAL FIX: Removed addPostFrameCallback - language changes are already handled in didChangeDependencies

    // Watch premium status for reactive UI updates
    final isPremium = ref.watch(unlockProvider).isPremium;

    if (isLoading) {
      return Scaffold(
        backgroundColor: widget.isDarkMode ? const Color(0xFF2D1B2E) : const Color(0xFFF5F5F5),
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.isDarkMode ? const Color(0xFFFF6B9D) : const Color(0xFFAD1457),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: widget.isDarkMode ? const Color(0xFF2D1B2E) : const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.isDarkMode
                  ? [
                      const Color(0xFF2D1B2E),
                      const Color(0xFF1A0E1F),
                    ]
                  : [
                      const Color(0xFFF5F5F5),
                      const Color(0xFFE8E8E8),
                    ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
  top: 16,
  left: 16,
  child: IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: widget.isDarkMode ? Colors.white : Colors.black87,
      size: 28,
    ),
    onPressed: () async {
  if (isPandoraMode) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.exit_to_app,
        iconColor: Colors.orange,
        title: l10n.leaveGame,
        content: l10n.leaveGameMessage,
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context),
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.leave,
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pop(true);
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            customColor: Colors.red,
            icon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  } else {
  // Use persistent counter from UnlockManager
  ref.read(unlockProvider.notifier).incrementBackButtonCount();
  final count = ref.read(unlockProvider).backButtonCount;
  
  // Show rating dialog every 5th back button press
  if (count % 5 == 0) {
    debugPrint('⭐ Checking if rating prompt needed (every 5th press)');
    if (!mounted) return;
    
    // Check if this deck should be rated (never rated OR 30+ days since last rating)
    final feedbackService = FeedbackService();
    final shouldPrompt = await feedbackService.shouldPromptRating(
      categoryName: widget.category,
      gameMode: widget.gameMode,
    );
    
    if (shouldPrompt) {
      debugPrint('✅ Showing rating dialog');
      await showRatingDialog(
        context,
        categoryName: widget.category,
        gameMode: widget.gameMode,
        isDarkMode: widget.isDarkMode,
      );
    } else {
      debugPrint('⏭️ User rated this deck recently - skipping prompt');
    }
  } else {
    debugPrint('⏭️ Skipping rating dialog (${5 - (count % 5)} more presses until next)');
  }
  
  if (mounted) {
    Navigator.of(context).pop(ref.read(unlockProvider).isPremium);
  }
}
},
  ),
),

              Positioned(
                top: 24,
                right: 24,
                child: GestureDetector(
                  onTap: isPandoraMode ? null : () {
                    final userPremiumStatus = ref.read(unlockProvider).isPremium;
                    if (userPremiumStatus) {
                      _showQuestionPicker();
                    } else {
                      _showPremiumRequiredDialog();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.black.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: widget.isDarkMode 
                            ? Colors.white.withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${currentIndex + 1}/${displayedQuestions.length}',
                          style: GoogleFonts.poppins(
                            color: widget.isDarkMode ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        if (!isPandoraMode) ...[
                          const SizedBox(width: 6),
                          Icon(
                            isPremium ? Icons.list : Icons.lock,
                            size: 18,
                            color: widget.isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    
                    Expanded(
                      child: displayedQuestions.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64,
                                    color: widget.isDarkMode ? Colors.white70 : Colors.black54,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    AppLocalizations.of(context)!.noQuestionsAvailable,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: widget.isDarkMode ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : CardSwiper(
                              key: ValueKey('card_swiper_${displayedQuestions.length}'),
                              controller: controller,
                              cardsCount: displayedQuestions.length,
                              initialIndex: currentIndex,
                              onSwipe: _onSwipe,
                              onUndo: _onUndo,
                              isLoop: false,
                              numberOfCardsDisplayed: 2,
                              backCardOffset: const Offset(0, 40),
                              padding: const EdgeInsets.all(24.0),
                              cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                                return QuestionCard(
                                  question: displayedQuestions[index],
                                  gameMode: widget.gameMode,
                                  category: widget.category,
                                  isDarkMode: widget.isDarkMode,
                                  logoUrl: logoUrl,
                                  isPandoraMode: isPandoraMode,
                                  isFavorite: favoriteQuestions.contains(displayedQuestions[index]),
                                  onFavoriteToggle: () => _toggleFavorite(displayedQuestions[index]),
                                );
                              },
                              isDisabled: isPandoraMode && !isHostMode,
                            ),
                    ),
                    
                    if (isPandoraMode && myParticipantId != null)
                      ReactionButtons(
                        currentReactions: currentReactions,
                        mySelectedReaction: mySelectedReaction,
                        onReactionTap: _addReaction,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPremiumRequiredDialog() {
  final l10n = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder: (context) => CustomDialog(
      isDarkMode: widget.isDarkMode,
      icon: Icons.lock,
      iconColor: const Color(0xFFFF6B9D),
      title: l10n.premiumFeatureTitle,
      content: l10n.questionNavigationPremium,
      actions: [
        DialogButton(
          text: l10n.mayBeLater,
          onPressed: () => Navigator.pop(context),
          isPrimary: false,
          isDarkMode: widget.isDarkMode,
        ),
        const SizedBox(height: 12),
        DialogButton(
          text: l10n.subscribe,
          onPressed: () async {
            Navigator.pop(context);

            final result = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
              ),
            );

            await _handleSubscriptionResult(result);
          },
          isPrimary: true,
          isDarkMode: widget.isDarkMode,
          icon: Icons.workspace_premium,
        ),
      ],
    ),
  );
}


  void _showQuestionPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => QuestionPicker(
        questions: displayedQuestions,
        currentIndex: currentIndex,
        isDarkMode: widget.isDarkMode,
        onQuestionSelected: (index) {
          setState(() {
            currentIndex = index;
          });
          controller.moveTo(index);

          if (isPandoraMode && isHostMode) {
            _updateDatabaseIndex(index);
          }

          _loadReactionsForCurrentQuestion();
        },
      ),
    );
  }
}