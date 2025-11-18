// lib/features/ai_deck/presentation/pages/ai_question_review_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/ai_deck_model.dart';
import '../../services/ai_deck_service.dart';

class AIQuestionReviewScreen extends StatefulWidget {
  final GenerationPrompts prompts;
  final bool isDarkMode;

  const AIQuestionReviewScreen({
    super.key,
    required this.prompts,
    required this.isDarkMode,
  });

  @override
  State<AIQuestionReviewScreen> createState() => _AIQuestionReviewScreenState();
}

class _AIQuestionReviewScreenState extends State<AIQuestionReviewScreen> {
  final CardSwiperController _swiperController = CardSwiperController();
  final AIDeckService _aiDeckService = AIDeckService();

  List<AIQuestion> _currentBatch = [];
  List<AIQuestion> _keptQuestions = [];
  int _currentIndex = 0;
  int _batchNumber = 1;
  bool _isLoading = true;
  bool _isGeneratingMore = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _generateInitialBatch();
  }

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  Future<void> _generateInitialBatch() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final response = await _aiDeckService.generateQuestions(
        prompts: widget.prompts,
        batchNumber: _batchNumber,
      );

      setState(() {
        // Only show first 10 cards (11th card is just for timing)
        _currentBatch = response.questions.take(10).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _generateMoreQuestions() async {
    if (_keptQuestions.length >= 50) {
      _finalizeDeck();
      return;
    }

    setState(() {
      _isGeneratingMore = true;
      _error = null;
    });

    try {
      _batchNumber++;
      final response = await _aiDeckService.generateQuestions(
        prompts: widget.prompts,
        batchNumber: _batchNumber,
      );

      setState(() {
        // Only show first 10 cards (11th card is just for timing)
        _currentBatch = response.questions.take(10).toList();
        _currentIndex = 0;
        _isGeneratingMore = false;
      });

      // Reset the swiper
      _swiperController.moveTo(0);
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isGeneratingMore = false;
      });
    }
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    if (previousIndex < _currentBatch.length) {
      final question = _currentBatch[previousIndex];

      if (direction == CardSwiperDirection.right) {
        // Keep the question
        setState(() {
          _keptQuestions.add(question);
        });
      }
      // Left swipe = discard (do nothing)

      // Track how many cards we've reviewed
      final reviewedCount = previousIndex + 1;

      setState(() {
        _currentIndex = reviewedCount;
      });

      // Check if we've reviewed all 10 questions in the batch
      // We generate 11 cards but only show 10, so the dialog appears after the 10th card is swiped
      if (reviewedCount >= _currentBatch.length) {
        // Small delay to ensure smooth transition after swipe animation
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            _showBatchCompleteDialog();
          }
        });
      }
    }
    return true; // Allow the swipe
  }

  void _showBatchCompleteDialog() {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomDialog(
        title: l10n.batchComplete,
        content: l10n.questionsInDeckMessage(_keptQuestions.length),
        isDarkMode: widget.isDarkMode,
        icon: Icons.check_circle_outline,
        iconColor: const Color(0xFF9C27B0),
        actions: [
          if (_keptQuestions.length >= 5)
            DialogButton(
              text: l10n.imDone,
              onPressed: () {
                Navigator.pop(context);
                _finalizeDeck();
              },
              isDarkMode: widget.isDarkMode,
              icon: Icons.save,
            ),
          if (_keptQuestions.length >= 5)
            const SizedBox(height: 12),
          DialogButton(
            text: _keptQuestions.length >= 50
                ? l10n.maxQuestionsReached
                : l10n.generateMore,
            onPressed: _keptQuestions.length >= 50
                ? () {}
                : () {
                    Navigator.pop(context);
                    _generateMoreQuestions();
                  },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            customColor: _keptQuestions.length >= 50 ? Colors.grey : const Color(0xFF9C27B0),
            icon: Icons.auto_awesome,
          ),
        ],
      ),
    );
  }

  void _finalizeDeck() async {
    final l10n = AppLocalizations.of(context)!;

    // Generate suggested deck name based on occasion and mood
    String suggestedName = _generateDeckName();

    // Ask for deck name with suggested name pre-filled
    final nameController = TextEditingController(text: suggestedName);
    final deckName = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomDialog(
        title: l10n.namYourDeck,
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suggested name based on your prompts:',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: widget.isDarkMode
                    ? Colors.white.withValues(alpha: 0.6)
                    : Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: l10n.deckNameHint,
                hintStyle: GoogleFonts.poppins(
                  color: widget.isDarkMode
                      ? Colors.white.withValues(alpha: 0.4)
                      : Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isDarkMode
                        ? Colors.white.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isDarkMode
                        ? Colors.white.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF9C27B0),
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: widget.isDarkMode
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.03),
              ),
              style: GoogleFonts.poppins(
                color: widget.isDarkMode ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              autofocus: true,
              onTap: () {
                // Select all text when tapped
                nameController.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: nameController.text.length,
                );
              },
            ),
          ],
        ),
        isDarkMode: widget.isDarkMode,
        icon: Icons.edit,
        iconColor: const Color(0xFF9C27B0),
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context),
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.save,
            onPressed: () => Navigator.pop(context, nameController.text),
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            customColor: const Color(0xFF9C27B0),
            icon: Icons.check,
          ),
        ],
      ),
    );

    if (deckName == null || deckName.trim().isEmpty) {
      return;
    }

    // Show loading
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Create the custom deck with AI questions
      final deckId = await _aiDeckService.createCustomDeckFromQuestions(
        deckName: deckName.trim(),
        keptQuestions: _keptQuestions,
        prompts: widget.prompts,
      );

      if (mounted) {
        Navigator.pop(context); // Close loading
        Navigator.pop(context, deckId); // Return to deck list with new deck ID

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.deckCreatedSuccess,
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.failedToCreateDeck,
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _generateDeckName() {
    // Generate a smart deck name based on the prompts
    final occasion = widget.prompts.occasion;
    final energy = widget.prompts.energy;
    final depth = widget.prompts.depth;
    final spice = widget.prompts.spice;

    // Create a concise name
    if (occasion.isNotEmpty) {
      return '$occasion Questions';
    }

    // Generate name based on slider combinations
    if (spice >= 3) {
      return 'Spicy Questions';
    } else if (energy >= 4 && depth <= 2) {
      return 'Fun Party Questions';
    } else if (energy <= 2 && depth >= 4) {
      return 'Deep Conversation Starters';
    } else if (depth >= 4) {
      return 'Deep Questions';
    } else if (energy >= 4) {
      return 'High Energy Starters';
    } else {
      return 'Conversation Deck';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return Scaffold(
        body: Container(
          decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 64,
                  color: Color(0xFF9C27B0),
                ),
                const SizedBox(height: 24),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF9C27B0)),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.generatingAiQuestions,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeHelper.getTextColor(widget.isDarkMode),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Container(
          decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.error,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _error!,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: ThemeHelper.getTextColor(widget.isDarkMode),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(l10n.goBack, style: GoogleFonts.poppins()),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (_isGeneratingMore) {
      return Scaffold(
        body: Container(
          decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 64,
                  color: Color(0xFF9C27B0),
                ),
                const SizedBox(height: 24),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF9C27B0)),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.generatingMoreQuestions,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeHelper.getTextColor(widget.isDarkMode),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.batchNumber(_batchNumber),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
              // Header with progress
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: ThemeHelper.getTextColor(widget.isDarkMode),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9C27B0).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.inventory_2,
                                color: Color(0xFF9C27B0),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n.questionsInDeck(_keptQuestions.length, 50),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF9C27B0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Save button (only show if user has at least 5 questions)
                        _keptQuestions.length >= 5
                            ? IconButton(
                                onPressed: _finalizeDeck,
                                icon: const Icon(
                                  Icons.save,
                                  color: Color(0xFF9C27B0),
                                ),
                                tooltip: l10n.imDone,
                              )
                            : const SizedBox(width: 48), // Balance the close button
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Progress bar
                    LinearProgressIndicator(
                      value: _currentIndex / _currentBatch.length,
                      backgroundColor: widget.isDarkMode
                          ? Colors.white.withValues(alpha: 0.2)
                          : Colors.black.withValues(alpha: 0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF9C27B0)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.questionProgress(_currentIndex, _currentBatch.length),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                      ),
                    ),
                  ],
                ),
              ),

              // Swipeable cards
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CardSwiper(
                    controller: _swiperController,
                    cardsCount: _currentBatch.length,
                    numberOfCardsDisplayed: 2,
                    backCardOffset: const Offset(0, 30),
                    padding: const EdgeInsets.all(0),
                    onSwipe: _onSwipe,
                    cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                      if (index >= _currentBatch.length) return const SizedBox();

                      final question = _currentBatch[index];

                      return _buildQuestionCard(question, index);
                    },
                  ),
                ),
              ),

              // Action buttons
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Discard button
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () => _swiperController.swipe(CardSwiperDirection.left),
                        icon: const Icon(Icons.close, size: 32),
                        color: Colors.red,
                      ),
                    ),

                    // Keep button
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () => _swiperController.swipe(CardSwiperDirection.right),
                        icon: const Icon(Icons.check, size: 32),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              // Instructions
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.swipe,
                      color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.swipeInstructions,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
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
  }

  Widget _buildQuestionCard(AIQuestion question, int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9C27B0).withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // AI badge
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'AI',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    question.question,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: Colors.white.withValues(alpha: 0.8),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppLocalizations.of(context)!.discussionPoint,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          question.answer,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white.withValues(alpha: 0.9),
                            height: 1.4,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}