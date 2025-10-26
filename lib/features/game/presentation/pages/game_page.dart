// lib/features/game/presentation/pages/game_page.dart
// FINAL VERSION - All fixes applied: any swipe moves forward, database syncs on every swipe, FAVORITE FUNCTIONALITY RESTORED

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../../core/services/pandora_service.dart';
import '../../../pandora/presentation/pages/session_stats_page.dart';

class GamePage extends StatefulWidget {
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
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final supabaseService = SupabaseService();
  final unlockManager = UnlockManager();
  final pandoraService = PandoraService();
  final CardSwiperController controller = CardSwiperController();
  String? _loadedLanguageCode; // Track what language questions are loaded in
  List<String> allQuestions = [];
  List<String> displayedQuestions = [];
  int currentIndex = 0;
  bool isLoading = true;
  String? logoUrl;
  
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  
  // Pandora multiplayer sync
  RealtimeChannel? sessionChannel;
  RealtimeChannel? reactionsChannel;
  bool isPandoraMode = false;
  bool isHostMode = false;
  
  // Reactions (REMOVED 'hundred')
  Map<String, int> currentReactions = {
    'laugh': 0,
    'shock': 0,
    'heart': 0,
    'fire': 0,
  };
  String? myParticipantId;
  
  // Favorite questions tracking
  Set<String> favoriteQuestions = {};

  @override
  void initState() {
    super.initState();
    isPandoraMode = widget.gameMode.toLowerCase() == 'pandora' && widget.sessionId != null;
    isHostMode = widget.isHost ?? false;
    
    _loadQuestions();
    _loadAd();
    _loadLogo();
    _loadFavoriteQuestions();
    
    // PLAYERS ONLY: Subscribe to database changes
    if (isPandoraMode && !isHostMode) {
      _subscribeToPandoraSync();
    }
    
    // BOTH: Subscribe to reactions if Pandora mode
    if (isPandoraMode) {
      _getMyParticipantId();
      _subscribeToReactions();
      _loadReactionsForCurrentQuestion();
    }
  }
  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  
  // Get current app language
  String currentLanguageCode = 'en';
  try {
    currentLanguageCode = Localizations.localeOf(context).languageCode;
  } catch (e) {
    // Context not ready
  }
  
  // If questions are loaded AND language changed, reload them
  if (_loadedLanguageCode != null && 
      _loadedLanguageCode != currentLanguageCode && 
      !isLoading) {
    debugPrint('🌍 Language changed from $_loadedLanguageCode to $currentLanguageCode - reloading');
    _loadQuestions();
  }
}
  Future<void> _loadFavoriteQuestions() async {
    if (isPandoraMode) return; // No favorites in Pandora mode
    
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return;
      
      // Find the user's Favorites deck
      final deckResponse = await Supabase.instance.client
          .from('custom_decks')
          .select('id')
          .eq('user_id', userId)
          .eq('deck_name', 'Favorites')
          .maybeSingle();
      
      if (deckResponse == null) {
        // No favorites deck yet
        return;
      }
      
      final deckId = deckResponse['id'];
      
      // Get all questions from the Favorites deck
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
    if (isPandoraMode) return; // No favorites in Pandora mode
    
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return;
      
      // Find or create the user's Favorites deck
      var deckResponse = await Supabase.instance.client
          .from('custom_decks')
          .select('id')
          .eq('user_id', userId)
          .eq('deck_name', 'Favorites')
          .maybeSingle();
      
      String deckId;
      
      if (deckResponse == null) {
        // Create a new Favorites deck
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
        // Remove from favorites
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
        // Add to favorites
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
      debugPrint('❌ Error details: ${e.toString()}');
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
      final userEmail = Supabase.instance.client.auth.currentUser?.email;
      final participants = await pandoraService.getParticipants(widget.sessionId!);
      
      final myParticipant = participants.firstWhere(
        (p) => p['user_email'] == userEmail || p['is_host'] == isHostMode,
        orElse: () => participants.first,
      );
      
      setState(() {
        myParticipantId = myParticipant['id'];
      });
    } catch (e) {
      debugPrint('Error getting participant ID: $e');
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
    if (!isPandoraMode) return;
    
    final reactions = await pandoraService.getReactionsForQuestion(
      widget.sessionId!,
      currentIndex,
    );
    
    if (mounted) {
      setState(() {
        currentReactions = reactions;
      });
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
    
    // Use database changes to sync
    sessionChannel = pandoraService.subscribeToSession(
      widget.sessionId!,
      (session) {
        final newIndex = session['current_question_index'] as int?;
        final status = session['status'] as String?;
        
        // Check if game ended
        if (status == 'ended' && mounted) {
          debugPrint('🎮 [Player] Game ended by host');
          _showGameEndDialog();
          return;
        }
        
        if (newIndex != null && mounted) {
          debugPrint('📡 [Player] DB update - question index: $newIndex (current: $currentIndex)');
          
          // Check if we've passed the last question
          if (newIndex >= displayedQuestions.length) {
            debugPrint('🎮 [Player] All questions completed');
            _showGameEndDialog();
            return;
          }
          
          if (newIndex != currentIndex && newIndex >= 0 && newIndex < displayedQuestions.length) {
            debugPrint('✅ [Player] Syncing to question: $newIndex');
            
            setState(() {
              currentIndex = newIndex;
            });
            
            // Move card swiper to new index
            controller.moveTo(newIndex);
            
            // Load reactions for new question
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
    
    if (unlockManager.isPremium) {
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
      isLoading = true;  // ADD THIS LINE AT THE START
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
        languageCode: languageCode, // <-- ADD THIS PARAMETER
      );

      if (!mounted) return;

      if (questions.isEmpty) {
  final l10n = AppLocalizations.of(context)!;
  setState(() {
    allQuestions = [l10n.noQuestionsFoundMessage(widget.category, widget.gameMode)];
    displayedQuestions = List.from(allQuestions);
    isLoading = false;
    _loadedLanguageCode = languageCode; // SAVE what language we loaded
  });
  return;
}

setState(() {
  allQuestions = questions;
  displayedQuestions = List.from(allQuestions);
  isLoading = false;
  _loadedLanguageCode = languageCode; // SAVE what language we loaded
});

debugPrint('✅ Loaded ${questions.length} questions in $languageCode');
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
    if (isPandoraMode) {
      return;
    }
    
    if (unlockManager.isPremium) {
      return;
    }

    if (unlockManager.shouldShowAd()) {
      if (!mounted) return;
      
      final l10n = AppLocalizations.of(context)!;
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            l10n.advertisement,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.watchAdMessage,
                style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  
                  if (_isAdLoaded && _interstitialAd != null) {
                    debugPrint('Showing ad...');
                    _interstitialAd!.show();
                    unlockManager.resetQuestionCount();
                  } else {
                    debugPrint('Ad not ready, continuing without ad');
                    unlockManager.resetQuestionCount();
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  _isAdLoaded ? l10n.watchAd : l10n.adLoadingContinue,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showAdFreePurchaseDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAD1457),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  l10n.goAdFree,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _showAdFreePurchaseDialog() {
    if (!mounted) return;
    
    final l10n = AppLocalizations.of(context)!;
    String? selectedBundle;
    
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                l10n.removeAdsForever,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.chooseOneBundle,
                    style: GoogleFonts.poppins(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _buildBundleOption(
                    'Couple Bundle',
                    'couple',
                    selectedBundle,
                    (value) => setState(() => selectedBundle = value),
                  ),
                  _buildBundleOption(
                    'Friends Bundle',
                    'friends',
                    selectedBundle,
                    (value) => setState(() => selectedBundle = value),
                  ),
                  _buildBundleOption(
                    'Family Bundle',
                    'family',
                    selectedBundle,
                    (value) => setState(() => selectedBundle = value),
                  ),
                ],
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          l10n.cancel,
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: selectedBundle != null
                            ? () {
                                unlockManager.unlockBundle(selectedBundle!);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      l10n.premiumActivated(selectedBundle!),
                                      style: GoogleFonts.poppins(),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAD1457),
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          l10n.subscribe,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.demoNote,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildBundleOption(
    String label,
    String value,
    String? selectedValue,
    Function(String) onSelected,
  ) {
    final isSelected = selectedValue == value;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => onSelected(value),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFAD1457) : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: isSelected ? Colors.white : Colors.grey,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FIXED: Any swipe direction moves forward, database updates on EVERY swipe
  bool _onSwipe(
    int previousIndex,
    int? currentIndexNullable,
    CardSwiperDirection direction,
  ) {
    final newIndex = currentIndexNullable ?? previousIndex;
    debugPrint('Swiped: prev=$previousIndex, new=$newIndex, dir=$direction');
    
    // PANDORA PLAYER: Block manual swiping
    if (isPandoraMode && !isHostMode) {
      debugPrint('🚫 [Player] Manual swiping blocked');
      return false;
    }
    
    // Check if we've reached the end
    if (newIndex >= displayedQuestions.length - 1) {
      debugPrint('🎮 Last question reached');
      
      setState(() {
        currentIndex = displayedQuestions.length - 1;
      });
      
      // PANDORA HOST: Update database to last question
      if (isPandoraMode && isHostMode) {
        _updateDatabaseIndex(displayedQuestions.length - 1);
      }
      
      Future.delayed(const Duration(milliseconds: 500), () {
        if (isPandoraMode && isHostMode) {
          pandoraService.endSession(widget.sessionId!);
        }
        _showGameEndDialog();
      });
      
      return false;
    }
    
    // Normal swipe - move forward
    setState(() {
      currentIndex = newIndex;
    });
    
    // PANDORA HOST: Update database for EVERY swipe
    if (isPandoraMode && isHostMode) {
      _updateDatabaseIndex(newIndex);
    }
    
    // Load reactions for new question
    _loadReactionsForCurrentQuestion();
    
    // Show ads (non-Pandora only)
    if (!isPandoraMode) {
      unlockManager.incrementQuestionCount();
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
    });
    
    // PANDORA HOST: Update database on undo
    if (isPandoraMode && isHostMode) {
      _updateDatabaseIndex(currentIndexArg);
    }
    
    return true;
  }

  void _showGameEndDialog() {
    if (!mounted) return;
    
    // Navigate to stats page for Pandora mode
    if (isPandoraMode) {
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
    
    // Regular thank you dialog for non-Pandora modes
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              const Icon(
                Icons.emoji_events,
                size: 64,
                color: Color(0xFFFFD700),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.thanksForPlaying,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Text(
            l10n.hopeYouHadFun,
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAD1457),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  l10n.backToMenu,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String?> _parseQuestion(String question) {
    final regex = RegExp(r'^\[(.+?)\]\s*(.+)$');
    final match = regex.firstMatch(question);
    
    if (match != null) {
      return {
        'targetName': match.group(1),
        'questionText': match.group(2),
      };
    }
    
    return {
      'targetName': null,
      'questionText': question,
    };
  }

  @override
  Widget build(BuildContext context) {
    // Check if language changed every time page is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || isLoading) return;
      
      String currentLanguage = 'da';
      try {
        currentLanguage = Localizations.localeOf(context).languageCode;
      } catch (e) {
        return;
      }
      
      if (_loadedLanguageCode != null && _loadedLanguageCode != currentLanguage) {
        debugPrint('🌍 Language changed: $_loadedLanguageCode → $currentLanguage');
        setState(() {
          isLoading = true;
        });
        _loadQuestions();
      }
    });
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
              // Back button (top left)
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: widget.isDarkMode ? Colors.white : Colors.black87,
                    size: 28,
                  ),
                  onPressed: () {
                    if (isPandoraMode) {
                      final l10n = AppLocalizations.of(context)!;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(l10n.leaveGame),
                          content: Text(l10n.leaveGameMessage),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(l10n.cancel),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close dialog
                                Navigator.of(context).pop(); // Leave game
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(l10n.leave),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),

              // Question counter (top right)
              // Question counter (top right) - CLICKABLE
            // Question counter (top right) - CLICKABLE (Premium only)
Positioned(
  top: 24,
  right: 24,
  child: GestureDetector(
    onTap: isPandoraMode ? null : () {
      if (unlockManager.isPremium) {
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
              unlockManager.isPremium ? Icons.list : Icons.lock,
              size: 18,
              color: widget.isDarkMode ? Colors.white : Colors.black87,
            ),
          ],
        ],
      ),
    ),
  ),
),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    
                    // Card swiper
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
                              controller: controller,
                              cardsCount: displayedQuestions.length,
                              onSwipe: _onSwipe,
                              onUndo: _onUndo,
                              numberOfCardsDisplayed: 2,
                              backCardOffset: const Offset(0, 40),
                              padding: const EdgeInsets.all(24.0),
                              cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                                return _buildQuestionCard(displayedQuestions[index]);
                              },
                              isDisabled: isPandoraMode && !isHostMode,
                            ),
                    ),
                    
                    // Reaction buttons for Pandora mode
                    if (isPandoraMode && myParticipantId != null)
                      _buildReactionButtons(),
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
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.lock, color: Color(0xFFFF6B9D)),
          const SizedBox(width: 12),
          Text(
            'Premium Feature',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        'Question navigation is a premium feature. Subscribe to unlock the ability to jump to any question!',
        style: GoogleFonts.poppins(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Maybe Later',
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate to subscription page
            // Add your subscription navigation here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B9D),
            foregroundColor: Colors.white,
          ),
          child: Text(
            'Subscribe',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
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
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF2D1B2E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.isDarkMode 
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.1),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Question',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: widget.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          
          // Question list
          Expanded(
            child: ListView.builder(
              itemCount: displayedQuestions.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final question = displayedQuestions[index];
                final isCurrentQuestion = index == currentIndex;
                
                // Extract first 4 words
                final words = question.split(' ');
                final displayText = words.length > 4 
                    ? '${words.take(4).join(' ')}...' 
                    : question;
                
                return GestureDetector(
                  onTap: () {
                    // Jump to selected question
                    setState(() {
                      currentIndex = index;
                    });
                    controller.moveTo(index);
                    Navigator.pop(context);
                    
                    // Update database if host in Pandora mode
                    if (isPandoraMode && isHostMode) {
                      _updateDatabaseIndex(index);
                    }
                    
                    // Load reactions for new question
                    _loadReactionsForCurrentQuestion();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isCurrentQuestion
                          ? (widget.isDarkMode 
                              ? const Color(0xFFFF6B9D).withValues(alpha: 0.3)
                              : const Color(0xFFFF6B9D).withValues(alpha: 0.1))
                          : (widget.isDarkMode
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.black.withValues(alpha: 0.03)),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isCurrentQuestion
                            ? const Color(0xFFFF6B9D)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Question number
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isCurrentQuestion
                                ? const Color(0xFFFF6B9D)
                                : (widget.isDarkMode
                                    ? Colors.white.withValues(alpha: 0.1)
                                    : Colors.black.withValues(alpha: 0.1)),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isCurrentQuestion
                                    ? Colors.white
                                    : (widget.isDarkMode ? Colors.white : Colors.black87),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        
                        // Question text (first 4 words)
                        Expanded(
                          child: Text(
                            displayText,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: widget.isDarkMode ? Colors.white : Colors.black87,
                              fontWeight: isCurrentQuestion 
                                  ? FontWeight.w600 
                                  : FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        // Current indicator
                        if (isCurrentQuestion)
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFFFF6B9D),
                            size: 24,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
 Widget _buildQuestionCard(String question) {
  final parsed = _parseQuestion(question);
  final targetName = parsed['targetName'];
  final questionText = parsed['questionText'] ?? question;
  
  List<Color> cardGradient;
  Color textColor;
  String? emoji;
  
  if (widget.gameMode.toLowerCase() == 'pandora') {
    cardGradient = widget.isDarkMode
        ? [const Color(0xFFC25483), const Color(0xFF9E4069)]
        : [const Color(0xFFFF80B5), const Color(0xFFFF5592)];
    textColor = Colors.white;
    emoji = '🔮';
  } else {
    switch (widget.gameMode.toLowerCase()) {
      case 'family':
        cardGradient = widget.isDarkMode
            ? [const Color(0xFFC99850), const Color(0xFFA96E4B)]
            : [const Color(0xFFFFD97A), const Color(0xFFFFAC5F)];
        textColor = Colors.white;
        break;
      case 'couple':
        cardGradient = widget.isDarkMode
            ? [const Color(0xFFC7697D), const Color(0xFF9E5168)]
            : [const Color(0xFFFF9DAF), const Color(0xFFFF6F91)];
        textColor = Colors.white;
        break;
      case 'friends':
          cardGradient = widget.isDarkMode
              ? [const Color(0xFF7E72A9), const Color(0xFF665E93)]
              : [const Color(0xFFC4B4E3), const Color(0xFFB2A4DB)];
          textColor = Colors.white;
          break;
      case 'personal':
      // Check if this is Favorites deck or regular custom deck
      final isFavoritesDeck = widget.category.toLowerCase() == 'favorites';
      
      if (isFavoritesDeck) {
        // Favorites deck - use heart red gradient
        cardGradient = widget.isDarkMode
            ? [const Color(0xFFD85E72), const Color(0xFFC4405A)] // Night mode - Favorites (muted rose red → deep rose)
            : [const Color(0xFFFF9BA8), const Color(0xFFFF6B85)]; // Day mode - Favorites (soft pink red → vibrant coral red)
      } else {
        // Regular custom deck - use aqua/teal gradient
        cardGradient = widget.isDarkMode
        ? [const Color(0xFF6C92A3), const Color(0xFF547A8D)] // Night mode - User decks
        : [const Color(0xFFB9D9E8), const Color(0xFFA4C8E0)]; // Day mode - User decks
      }
        textColor = Colors.white;
        break;
      default:
        cardGradient = [const Color(0xFFE8D6D0), const Color(0xFFD7B299)];
        textColor = const Color(0xFF4A3A33);
    }
  }
  
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.6,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: cardGradient,
      ),
      borderRadius: BorderRadius.circular(32),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 40,
          offset: const Offset(0, 15),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 8),
          spreadRadius: -5,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 60),
        child: Stack(
          children: [
            // Connect logo at top (keep original)
            if (emoji == null)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: logoUrl != null
                      ? Image.network(
                          logoUrl!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox.shrink();
                          },
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            
            // Emoji for Pandora mode
            if (emoji != null)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 64),
                  ),
                ),
              ),
            
            // Question text
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  questionText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            
            // Target name badge
            if (targetName != null)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          targetName,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
            // Favorite heart button
            if (!isPandoraMode)
              Positioned(
                bottom: targetName != null ? 70 : 20,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => _toggleFavorite(question),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        favoriteQuestions.contains(question)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favoriteQuestions.contains(question)
                            ? Colors.red
                            : Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
  
  Widget _buildReactionButtons() {
    // REMOVED 100 emoji
    final reactions = [
      {'emoji': '😂', 'type': 'laugh'},
      {'emoji': '😮', 'type': 'shock'},
      {'emoji': '❤️', 'type': 'heart'},
      {'emoji': '🔥', 'type': 'fire'},
    ];
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: reactions.map((reaction) {
          final type = reaction['type'] as String;
          final emoji = reaction['emoji'] as String;
          final count = currentReactions[type] ?? 0;
          
          return GestureDetector(
            onTap: () => _addReaction(type),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                  if (count > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      '$count',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFF6B9D),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}