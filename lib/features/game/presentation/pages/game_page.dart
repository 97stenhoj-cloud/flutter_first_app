import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:math';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../../l10n/app_localizations.dart';

class GamePage extends StatefulWidget {
  final String gameMode;
  final String category;
  final bool isDarkMode;
  
  const GamePage({
    super.key,
    required this.gameMode,
    required this.category,
    required this.isDarkMode,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final supabaseService = SupabaseService();
  final unlockManager = UnlockManager();
  
  List<String> availableQuestions = [];
  List<String> usedQuestions = [];
  String currentQuestion = '';
  bool isLoading = true;
  
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _loadAd();
  }

  @override
  void dispose() {
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
          setState(() {
            _interstitialAd = ad;
            _isAdLoaded = true;
          });
          
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('Ad dismissed');
              ad.dispose();
              setState(() {
                _isAdLoaded = false;
              });
              _loadAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('Ad failed to show: $error');
              ad.dispose();
              setState(() {
                _isAdLoaded = false;
              });
              _loadAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('Ad failed to load: $error');
          setState(() {
            _isAdLoaded = false;
          });
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) _loadAd();
          });
        },
      ),
    );
  }

  void _showAdOrPurchaseOption() {
    if (unlockManager.isPremium) {
      return;
    }

    if (unlockManager.shouldShowAd()) {
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
                  style: GoogleFonts.poppins(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...[
                  {'name': 'Couple', 'color': const Color(0xFFAD1457)},
                  {'name': 'Friends', 'color': const Color(0xFFFF8F00)},
                  {'name': 'Family', 'color': const Color(0xFF8D6E63)},
                ].map((bundle) {
                  final isSelected = selectedBundle == bundle['name'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      onTap: () {
                        setDialogState(() {
                          selectedBundle = bundle['name'] as String;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? (bundle['color'] as Color).withValues(alpha: 0.2)
                              : Colors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? (bundle['color'] as Color)
                                : Colors.grey,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? (bundle['color'] as Color)
                                      : Colors.grey,
                                  width: 2,
                                ),
                                color: isSelected
                                    ? (bundle['color'] as Color)
                                    : Colors.transparent,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.bundle(bundle['name'] as String),
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    l10n.premiumCategories,
                                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
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
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            l10n.noAdsForever,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.pricePerMonth,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFAD1457),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
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
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  l10n.cancel,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
              ElevatedButton(
                onPressed: selectedBundle != null
                    ? () {
                        unlockManager.unlockBundle(selectedBundle!);
                        Navigator.pop(context);
                        setState(() {});
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.premiumActivated(selectedBundle!),
                              style: GoogleFonts.poppins(),
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAD1457),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Text(
                  l10n.subscribe,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await supabaseService.getQuestions(
        widget.gameMode,
        widget.category,
      );

      if (questions.isEmpty && mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          currentQuestion = l10n.noQuestionsFoundMessage(widget.category, widget.gameMode);
          isLoading = false;
        });
        return;
      }

      setState(() {
        availableQuestions = questions;
        isLoading = false;
      });

      if (availableQuestions.isNotEmpty) {
        _showNextQuestion();
      }
    } catch (e) {
      debugPrint('Error loading questions: $e');
      
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          currentQuestion = l10n.errorLoadingQuestions;
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

  void _showNextQuestion() {
    if (availableQuestions.isEmpty) {
      _showGameEndDialog();
      return;
    }

    final random = Random();
    final questionIndex = random.nextInt(availableQuestions.length);
    
    setState(() {
      if (currentQuestion.isNotEmpty) {
        usedQuestions.add(currentQuestion);
        unlockManager.incrementQuestionCount();
      }
      
      currentQuestion = availableQuestions[questionIndex];
      availableQuestions.removeAt(questionIndex);
    });

    _showAdOrPurchaseOption();
  }

  void _showPreviousQuestion() {
    if (usedQuestions.isEmpty) {
      return;
    }

    setState(() {
      if (currentQuestion.isNotEmpty) {
        availableQuestions.add(currentQuestion);
      }
      
      currentQuestion = usedQuestions.removeLast();
    });
  }

  void _onSwipe(DragEndDetails details) {
    const double sensitivity = 100.0;
    
    if (details.primaryVelocity! > sensitivity) {
      _showPreviousQuestion();
    } else if (details.primaryVelocity! < -sensitivity) {
      _showNextQuestion();
    }
  }

  void _showGameEndDialog() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final backgroundColor = ThemeHelper.getGameBackgroundColor(widget.gameMode, widget.isDarkMode);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: _onSwipe,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
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
                
                Expanded(
                  child: Center(
                    child: isLoading 
                        ? CircularProgressIndicator(
                            color: ThemeHelper.getTextColor(widget.isDarkMode),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              currentQuestion,
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: ThemeHelper.getTextColor(widget.isDarkMode),
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                ),
                
                if (!isLoading) ...[
                  Text(
                    l10n.swipeOrTap,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ThemeHelper.getTextColor(widget.isDarkMode).withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: usedQuestions.isEmpty ? null : _showPreviousQuestion,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: usedQuestions.isEmpty 
                              ? Colors.grey 
                              : ThemeHelper.getTextColor(widget.isDarkMode),
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        '${usedQuestions.length + 1}/${usedQuestions.length + availableQuestions.length + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(width: 40),
                      IconButton(
                        onPressed: availableQuestions.isEmpty ? null : _showNextQuestion,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: availableQuestions.isEmpty 
                              ? Colors.grey 
                              : ThemeHelper.getTextColor(widget.isDarkMode),
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}