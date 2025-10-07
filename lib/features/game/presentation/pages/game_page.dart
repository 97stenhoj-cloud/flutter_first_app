import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:math';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/supabase_service.dart';

class GamePage extends StatefulWidget {
  final int playerCount;
  final String gameMode;
  final String category;
  final bool isDarkMode;
  
  const GamePage({
    super.key,
    required this.playerCount,
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
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Advertisement',
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
                'Watch a short ad to continue, or go ad-free with premium!',
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
                          'Ad not ready. Continuing without ad.',
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
                  _isAdLoaded ? 'Watch Ad' : 'Ad Loading... Continue',
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
                  'Go Ad-Free - 59 DKK/month',
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
    final availableBundles = ['Couple', 'Friends', 'Family'];
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
              'Remove Ads Forever',
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
                  'Choose 1 bundle to unlock and remove all ads',
                  style: GoogleFonts.poppins(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...availableBundles.map((bundle) {
                  final isSelected = selectedBundle == bundle;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        setDialogState(() {
                          selectedBundle = bundle;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? const Color(0xFFAD1457).withValues(alpha: 0.2)
                              : Colors.grey[200],
                          border: Border.all(
                            color: isSelected 
                                ? const Color(0xFFAD1457)
                                : Colors.grey[400]!,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSelected 
                                  ? Icons.radio_button_checked 
                                  : Icons.radio_button_unchecked,
                              color: isSelected 
                                  ? const Color(0xFFAD1457)
                                  : Colors.grey[600],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bundle,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '4 premium categories',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey[600],
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
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green[300]!),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'No Ads Forever',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '59 DKK/month',
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
                  'Demo: Unlocks will reset on app restart',
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
                  'Cancel',
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
                              'Premium activated! Ads removed. $selectedBundle bundle unlocked.',
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
                  'Subscribe',
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
    setState(() {
      isLoading = true;
    });

    try {
      debugPrint('Loading questions for:');
      debugPrint('   Game Mode: ${widget.gameMode}');
      debugPrint('   Category: ${widget.category}');
      
      // FIXED: Now passing both gameMode and category
      final fetchedQuestions = await supabaseService.getQuestions(
        widget.gameMode,
        widget.category
      );
      
      debugPrint('Received ${fetchedQuestions.length} questions');
      
      setState(() {
        availableQuestions = List.from(fetchedQuestions);
        isLoading = false;
      });
      
      if (availableQuestions.isNotEmpty) {
        _showNextQuestion();
      } else {
        setState(() {
          currentQuestion = 'No questions found for ${widget.category} in ${widget.gameMode} mode';
          isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      debugPrint('Error in _loadQuestions: $e');
      debugPrint('Stack trace: $stackTrace');
      
      setState(() {
        currentQuestion = 'Error loading questions. Please check your connection.';
        isLoading = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to load questions: $e',
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
      _showNextQuestion();
    } else if (details.primaryVelocity! < -sensitivity) {
      _showPreviousQuestion();
    }
  }

  void _showGameEndDialog() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: Center(
                    child: isLoading 
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            currentQuestion,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                const Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 15,
                                  color: Colors.white,
                                ),
                                const Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                
                if (!isLoading)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      backgroundColor: Colors.white.withValues(alpha: 0.3),
                      foregroundColor: Colors.white,
                      child: const Icon(Icons.home, size: 28),
                    ),
                  ),
                
                if (!isLoading)
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: usedQuestions.isEmpty ? null : _showPreviousQuestion,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: usedQuestions.isEmpty 
                                      ? Colors.transparent 
                                      : Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: usedQuestions.isEmpty 
                                          ? Colors.white30 
                                          : Colors.white70,
                                      size: 20,
                                    ),
                                    Text(
                                      'Previous',
                                      style: GoogleFonts.poppins(
                                        color: usedQuestions.isEmpty 
                                            ? Colors.white30 
                                            : Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            Text(
                              'Swipe or tap arrows',
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                            GestureDetector(
                              onTap: availableQuestions.isEmpty ? null : _showNextQuestion,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: availableQuestions.isEmpty 
                                      ? Colors.transparent 
                                      : Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Next',
                                      style: GoogleFonts.poppins(
                                        color: availableQuestions.isEmpty 
                                            ? Colors.white30 
                                            : Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: availableQuestions.isEmpty 
                                          ? Colors.white30 
                                          : Colors.white70,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${usedQuestions.length + 1} of ${usedQuestions.length + availableQuestions.length + 1}',
                          style: GoogleFonts.poppins(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}