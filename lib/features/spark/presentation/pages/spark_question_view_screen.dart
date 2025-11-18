// lib/features/spark/presentation/pages/spark_question_view_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../models/spark_question.dart';
import '../../services/spark_service.dart';
import '../../../../core/services/custom_deck_service.dart';

class SparkQuestionViewScreen extends ConsumerStatefulWidget {
  final List<SparkQuestion> questions;
  final bool isDarkMode;

  const SparkQuestionViewScreen({
    super.key,
    required this.questions,
    required this.isDarkMode,
  });

  @override
  ConsumerState<SparkQuestionViewScreen> createState() => _SparkQuestionViewScreenState();
}

class _SparkQuestionViewScreenState extends ConsumerState<SparkQuestionViewScreen> {
  final _sparkService = SparkService();
  final _customDeckService = CustomDeckService();
  late final CardSwiperController _cardController;

  int _currentIndex = 0;
  bool _isProcessing = false;
  final Set<String> _favoritedQuestions = {}; // Track favorited questions by ID

  @override
  void initState() {
    super.initState();
    _cardController = CardSwiperController();
    // Initialize favorited questions from the data
    for (final question in widget.questions) {
      if (question.isFavorited) {
        _favoritedQuestions.add(question.id);
      }
    }
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndexNullable,
    CardSwiperDirection direction,
  ) {
    final newIndex = currentIndexNullable ?? previousIndex;

    // Check if we're at the last question
    if (previousIndex == widget.questions.length - 1) {
      // All questions viewed, close the screen
      Navigator.pop(context);
      return false; // Block the swipe
    }

    // Update current index
    setState(() {
      _currentIndex = newIndex;
    });

    return true; // Allow the swipe
  }

  Future<void> _addToFavorites() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final question = widget.questions[_currentIndex];
      final added = await _sparkService.addToFavorites(question);

      if (mounted) {
        // Update favorited state
        if (added) {
          setState(() {
            _favoritedQuestions.add(question.id);
          });
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              added ? '❤️ Added to Favorites!' : 'Already in Favorites',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: added ? Colors.green : Colors.orange,
            duration: const Duration(seconds: 2),
          ),
        );

        // No auto-swipe - let user swipe manually
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error adding to favorites: ${e.toString()}',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<void> _showDeckSelector() async {
    if (_isProcessing) return;

    try {
      // Fetch user's custom decks
      final decks = await _customDeckService.getUserDecks();

      // Filter out the Favorites deck (since we have a separate button for that)
      final selectableDecks = decks.where((deck) =>
        !_customDeckService.isFavoritesDeck(deck)
      ).toList();

      if (!mounted) return;

      if (selectableDecks.isEmpty) {
        _showCreateDeckPrompt();
        return;
      }

      // Show deck selection dialog
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
          title: 'Add to Deck',
          content: 'Choose a deck to add this question to:',
          isDarkMode: widget.isDarkMode,
          icon: Icons.folder,
          iconColor: const Color(0xFF2196F3),
          actions: [
            // List of decks
            Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...selectableDecks.map((deck) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: DialogButton(
                        text: deck['deck_name'] as String,
                        onPressed: () {
                          Navigator.pop(context);
                          _addToDeck(deck['id'] as String, deck['deck_name'] as String);
                        },
                        isPrimary: false,
                        isDarkMode: widget.isDarkMode,
                        icon: Icons.folder_outlined,
                      ),
                    )),
                    const SizedBox(height: 8),
                    DialogButton(
                      text: 'Create New Deck',
                      onPressed: () {
                        Navigator.pop(context);
                        _showCreateDeckDialog();
                      },
                      isPrimary: true,
                      isDarkMode: widget.isDarkMode,
                      customColor: const Color(0xFF4CAF50),
                      icon: Icons.add,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            DialogButton(
              text: 'Cancel',
              onPressed: () => Navigator.pop(context),
              isPrimary: false,
              isDarkMode: widget.isDarkMode,
            ),
          ],
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error loading decks: ${e.toString()}',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _addToDeck(String deckId, String deckName) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final question = widget.questions[_currentIndex];
      await _sparkService.addToDeck(question, deckId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '📁 Added to "$deckName"!',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );

        // No auto-swipe - let user swipe manually
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString().contains('already exists')
                  ? 'Question already in this deck'
                  : 'Error adding to deck: ${e.toString()}',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showCreateDeckPrompt() {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'No Decks Found',
        content: 'You don\'t have any custom decks yet. Would you like to create one?',
        isDarkMode: widget.isDarkMode,
        icon: Icons.folder_off,
        iconColor: Colors.orange,
        actions: [
          DialogButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
          ),
          DialogButton(
            text: 'Create Deck',
            onPressed: () {
              Navigator.pop(context);
              _showCreateDeckDialog();
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.add,
          ),
        ],
      ),
    );
  }

  void _showCreateDeckDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Create New Deck',
        contentWidget: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Enter deck name',
            filled: true,
            fillColor: widget.isDarkMode
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        isDarkMode: widget.isDarkMode,
        icon: Icons.create_new_folder,
        iconColor: const Color(0xFF4CAF50),
        actions: [
          DialogButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
          ),
          DialogButton(
            text: 'Create & Add',
            onPressed: () async {
              final deckName = controller.text.trim();
              if (deckName.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter a deck name', style: GoogleFonts.poppins()),
                    backgroundColor: Colors.orange,
                  ),
                );
                return;
              }

              Navigator.pop(context);

              try {
                final deckId = await _customDeckService.createDeck(deckName);
                _addToDeck(deckId, deckName);
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error creating deck: ${e.toString()}',
                        style: GoogleFonts.poppins(),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.add,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentIndex + 1) / widget.questions.length;

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
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: ThemeHelper.getTextColor(widget.isDarkMode),
                            size: 28,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Spark Questions',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeHelper.getTextColor(widget.isDarkMode),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Question ${_currentIndex + 1} of ${widget.questions.length}',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 48), // Balance the close button
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: widget.isDarkMode
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.1),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B9D)),
                      ),
                    ),
                  ],
                ),
              ),

              // Question card swiper
              Expanded(
                child: CardSwiper(
                  controller: _cardController,
                  cardsCount: widget.questions.length,
                  initialIndex: _currentIndex,
                  onSwipe: _onSwipe,
                  isLoop: false,
                  numberOfCardsDisplayed: 2,
                  backCardOffset: const Offset(0, 40),
                  padding: const EdgeInsets.all(24.0),
                  cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                    final question = widget.questions[index];

                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: ThemeHelper.getGameModeGradient('spark', widget.isDarkMode),
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
                        child: Stack(
                          children: [
                            // Spark logo at top
                            Positioned(
                              top: 60,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Image.network(
                                  'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/Spark.png',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                  color: const Color(0xFFFF6B9D),
                                  colorBlendMode: BlendMode.modulate,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.auto_awesome,
                                      size: 120,
                                      color: Color(0xFFFF6B9D),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Question text (centered)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  question.question,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    height: 1.5,
                                    letterSpacing: 0.3,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),

                            // Action buttons overlay at bottom
                            Positioned(
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Favorite button
                                    GestureDetector(
                                      onTap: _isProcessing ? null : _addToFavorites,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: _favoritedQuestions.contains(question.id)
                                              ? const Color(0xFFFF6B9D).withValues(alpha: 0.3)
                                              : Colors.white.withValues(alpha: 0.3),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: _favoritedQuestions.contains(question.id)
                                              ? const Color(0xFFFF6B9D)
                                              : Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    // Add to deck button
                                    GestureDetector(
                                      onTap: _isProcessing ? null : _showDeckSelector,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.3),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.folder,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Swipe hint text
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Swipe to continue',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
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
}
