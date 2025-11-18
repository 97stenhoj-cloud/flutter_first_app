// lib/features/spark/presentation/pages/spark_single_question_view.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../models/spark_question.dart';
import '../../services/spark_service.dart';
import '../../../../core/services/custom_deck_service.dart';

class SparkSingleQuestionView extends ConsumerStatefulWidget {
  final SparkQuestion question;
  final bool isDarkMode;

  const SparkSingleQuestionView({
    super.key,
    required this.question,
    required this.isDarkMode,
  });

  @override
  ConsumerState<SparkSingleQuestionView> createState() => _SparkSingleQuestionViewState();
}

class _SparkSingleQuestionViewState extends ConsumerState<SparkSingleQuestionView> {
  final _sparkService = SparkService();
  final _customDeckService = CustomDeckService();

  bool _isProcessing = false;
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.question.isFavorited;
  }

  Future<void> _addToFavorites() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final added = await _sparkService.addToFavorites(widget.question);

      if (mounted) {
        if (added) {
          setState(() {
            _isFavorited = true;
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
      final decks = await _customDeckService.getUserDecks();

      if (!mounted) return;

      if (decks.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No decks available. Create a deck first in Personal mode.',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final selectedDeck = await showDialog<Map<String, dynamic>>(
        context: context,
        builder: (context) => CustomDialog(
          isDarkMode: widget.isDarkMode,
          icon: Icons.folder_open,
          iconColor: const Color(0xFFFF6B9D),
          title: 'Select Deck',
          contentWidget: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: decks.length,
              itemBuilder: (context, index) {
                final deck = decks[index];
                final deckName = deck['deck_name'] as String;
                final isFavorites = _customDeckService.isFavoritesDeck(deck);

                return ListTile(
                  leading: Icon(
                    isFavorites ? Icons.favorite : Icons.folder,
                    color: ThemeHelper.getGameModeGradient('spark', widget.isDarkMode)[0],
                  ),
                  title: Text(
                    deckName,
                    style: GoogleFonts.poppins(
                      color: widget.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, deck),
                );
              },
            ),
          ),
          actions: [
            DialogButton(
              text: 'Cancel',
              onPressed: () => Navigator.pop(context),
              isDarkMode: widget.isDarkMode,
            ),
          ],
        ),
      );

      if (selectedDeck != null && mounted) {
        await _addToDeck(selectedDeck);
      }
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

  Future<void> _addToDeck(Map<String, dynamic> deck) async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final deckId = deck['id'] as String;
      final deckName = deck['deck_name'] as String;

      await _customDeckService.addQuestion(deckId, widget.question.question);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Spark Question',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),

              // Question card (centered, no swipe)
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
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
                                  widget.question.question,
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
                                          color: _isFavorited
                                              ? const Color(0xFFFF6B9D).withValues(alpha: 0.3)
                                              : Colors.white.withValues(alpha: 0.3),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: _isFavorited
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
