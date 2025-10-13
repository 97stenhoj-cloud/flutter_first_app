// Optimized with flutter_card_swiper package
// lib/features/game/presentation/pages/game_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/services/supabase_service.dart';

class GamePage extends StatefulWidget {
  final String gameMode;
  final String category;
  final bool isDarkMode;
  final List<String>? customQuestions;  // ADDED: Support for custom questions

  const GamePage({
    super.key,
    required this.gameMode,
    required this.category,
    required this.isDarkMode,
    this.customQuestions,  // ADDED: Optional custom questions parameter
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final supabaseService = SupabaseService();
  final unlockManager = UnlockManager();
  final CardSwiperController controller = CardSwiperController();

  List<String> allQuestions = [];
  List<String> displayedQuestions = [];
  int currentIndex = 0;
  bool isLoading = true;
  String? logoUrl;
  
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _loadAd();
    _loadLogo();
  }

  @override
  void dispose() {
    controller.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadAd() {
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

  void _showAdOrPurchaseOption() {
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
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
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
                  style: GoogleFonts.poppins(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...[
                  {'name': l10n.family, 'key': 'family'},
                  {'name': l10n.couple, 'key': 'couple'},
                  {'name': l10n.friends, 'key': 'friends'},
                ].map((bundle) {
                  final isSelected = selectedBundle == bundle['key'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        setDialogState(() {
                          selectedBundle = bundle['key'];
                        });
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? const Color(0xFFAD1457).withValues(alpha: 0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected 
                                ? const Color(0xFFAD1457)
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSelected 
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: isSelected 
                                  ? const Color(0xFFAD1457)
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bundle['name']!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected ? const Color(0xFFAD1457) : Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    l10n.premiumCategories,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black87,
                        ),
                        child: Text(
                          l10n.cancel,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
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
            ),
          );
        },
      ),
    );
  }

  Future<void> _loadQuestions() async {
    try {
      // FIXED: Check if custom questions are provided first
      if (widget.customQuestions != null && widget.customQuestions!.isNotEmpty) {
        setState(() {
          allQuestions = widget.customQuestions!;
          displayedQuestions = List.from(allQuestions);
          isLoading = false;
        });
        return;
      }
      
      // Original code for loading from Supabase
      final questions = await supabaseService.getQuestions(
        widget.gameMode,
        widget.category,
      );

      if (!mounted) return;

      if (questions.isEmpty) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          allQuestions = [l10n.noQuestionsFoundMessage(widget.category, widget.gameMode)];
          displayedQuestions = List.from(allQuestions);
          isLoading = false;
        });
        return;
      }

      setState(() {
        allQuestions = questions;
        displayedQuestions = List.from(allQuestions);
        isLoading = false;
      });
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

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint('Swiped: direction=$direction, previous=$previousIndex, current=$currentIndex');
    
    // Swipe RIGHT (left to right) = undo to go back
    if (direction == CardSwiperDirection.right) {
      return true;
    }
    
    // Swipe LEFT (right to left) = go to next question
    if (direction == CardSwiperDirection.left) {
      unlockManager.incrementQuestionCount();
      _showAdOrPurchaseOption();
      
      // Check if we've reached the end
      if (currentIndex == null || currentIndex >= displayedQuestions.length - 1) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _showGameEndDialog();
        });
        return true;
      }
    }
    
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint('Undo: previous $previousIndex, current $currentIndex');
    return true;
  }

  void _showGameEndDialog() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    // Get background gradient based on game mode
    List<Color> backgroundGradient;
    
    switch (widget.gameMode.toLowerCase()) {
      case 'family':
        backgroundGradient = widget.isDarkMode
            ? [const Color(0xFF4A3A30), const Color(0xFF3A2A20)]
            : [const Color(0xFFF5E8E1), const Color(0xFFE8D6D0)];
        break;
      case 'couple':
        backgroundGradient = widget.isDarkMode
            ? [const Color(0xFF5A3A44), const Color(0xFF4A2A34)]
            : [const Color(0xFFFCE4EC), const Color(0xFFFAD4DD)];
        break;
      case 'friends':
        backgroundGradient = widget.isDarkMode
            ? [const Color(0xFF4A3A5A), const Color(0xFF3A2A4A)]
            : [const Color(0xFFE8DAEF), const Color(0xFFD4C4E8)];
        break;
      case 'personal':
        backgroundGradient = widget.isDarkMode
            ? [const Color(0xFF3A4A5A), const Color(0xFF2A3A4A)]
            : [const Color(0xFFD4E4F8), const Color(0xFFC4D4E8)];
        break;
      default:
        backgroundGradient = [const Color(0xFFF5E8E1), const Color(0xFFE8D6D0)];
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: backgroundGradient,
          ),
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.home,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 32,
                      ),
                    ),
                    Text(
                      widget.category,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                
                // Card Swiper
                Expanded(
                  child: Center(
                    child: isLoading 
                        ? CircularProgressIndicator(
                            color: ThemeHelper.getTextColor(widget.isDarkMode),
                          )
                        : displayedQuestions.isEmpty
                            ? Text(
                                'No questions available',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: ThemeHelper.getTextColor(widget.isDarkMode),
                                ),
                              )
                            : CardSwiper(
                                controller: controller,
                                cardsCount: displayedQuestions.length,
                                onSwipe: _onSwipe,
                                onUndo: _onUndo,
                                numberOfCardsDisplayed: 2,
                                backCardOffset: const Offset(0, 15),
                                padding: const EdgeInsets.all(0),
                                scale: 0.93,
                                isLoop: false,
                                duration: const Duration(milliseconds: 300),
                                maxAngle: 25,
                                threshold: 50,
                                allowedSwipeDirection: AllowedSwipeDirection.only(
                                  left: true,
                                  right: true,
                                ),
                                cardBuilder: (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) {
                                  return _buildQuestionCard(
                                    displayedQuestions[index],
                                    isNext: false,
                                  );
                                },
                              ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(String question, {bool isNext = false}) {
    // Get gradient colors based on game mode
    List<Color> cardGradient;
    Color textColor;
    
    switch (widget.gameMode.toLowerCase()) {
      case 'family':
        cardGradient = widget.isDarkMode
            ? [const Color(0xFF7B5D47), const Color(0xFF5D4537)]
            : [const Color(0xFFE8D6D0), const Color(0xFFD7B299)];
        textColor = widget.isDarkMode ? Colors.white : const Color(0xFF4A3A33);
        break;
      case 'couple':
        cardGradient = widget.isDarkMode
            ? [const Color(0xFF8A6A64), const Color(0xFF6B4A54)]
            : [const Color(0xFFF28B9C), const Color(0xFFF5A877)];
        textColor = Colors.white;
        break;
      case 'friends':
        cardGradient = widget.isDarkMode
            ? [const Color(0xFF6B5A72), const Color(0xFF4B3A52)]
            : [const Color(0xFFB995D3), const Color(0xFF9B7AB8)];
        textColor = Colors.white;
        break;
      case 'personal':
        cardGradient = widget.isDarkMode
            ? [const Color(0xFF5A6A7B), const Color(0xFF4A5A6B)]
            : [const Color(0xFF90B5E8), const Color(0xFF7A9AD7)];
        textColor = Colors.white;
        break;
      default:
        cardGradient = [const Color(0xFFE8D6D0), const Color(0xFFD7B299)];
        textColor = const Color(0xFF4A3A33);
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
              // Logo at top center
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: logoUrl != null
                      ? Opacity(
                          opacity: 0.7,
                          child: Image.network(
                            logoUrl!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                'Connect',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: textColor.withValues(alpha: 0.6),
                                  letterSpacing: 2.0,
                                ),
                              );
                            },
                          ),
                        )
                      : Text(
                          'Connect',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textColor.withValues(alpha: 0.6),
                            letterSpacing: 2.0,
                          ),
                        ),
                ),
              ),
              
              // Question text in center
              Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    question,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      letterSpacing: -0.3,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 8,
                          color: Colors.black.withValues(alpha: 0.3),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}