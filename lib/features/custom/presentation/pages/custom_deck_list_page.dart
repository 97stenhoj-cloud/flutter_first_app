// lib/features/custom/presentation/pages/custom_deck_list_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/services/custom_deck_service.dart';
import '../../../../../core/utils/theme_helper.dart';
import 'question_editor_page.dart';
import '../../../game/presentation/pages/game_page.dart';

class CustomDeckListPage extends StatefulWidget {
  final bool isDarkMode;

  const CustomDeckListPage({super.key, required this.isDarkMode});

  @override
  State<CustomDeckListPage> createState() => _CustomDeckListPageState();
}

class _CustomDeckListPageState extends State<CustomDeckListPage> {
  final customDeckService = CustomDeckService();
  List<Map<String, dynamic>> decks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDecks();
  }

  Future<void> _loadDecks() async {
    try {
      // Ensure Favorites deck exists
      await customDeckService.ensureFavoritesDeck();
      
      final fetchedDecks = await customDeckService.getUserDecks();
      setState(() {
        decks = fetchedDecks;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading decks: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _createDeck() async {
    final controller = TextEditingController();

    final deckName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create New Deck', style: GoogleFonts.poppins()),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Deck name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text('Create', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );

    if (deckName != null && deckName.isNotEmpty) {
      try {
        await customDeckService.createDeck(deckName);
        _loadDecks();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deck created!', style: GoogleFonts.poppins()),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create deck', style: GoogleFonts.poppins()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _deleteDeck(String deckId, String deckName) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Deck', style: GoogleFonts.poppins()),
        content: Text(
          'Are you sure you want to delete "$deckName"? This will delete all questions in this deck.',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await customDeckService.deleteDeck(deckId);
        _loadDecks();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deck deleted', style: GoogleFonts.poppins()),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete deck', style: GoogleFonts.poppins()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    Text(
                      'Custom Decks',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                      ),
                    ),
                    IconButton(
                      onPressed: _createDeck,
                      icon: Icon(
                        Icons.add,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ThemeHelper.getTextColor(widget.isDarkMode),
                            ),
                          ),
                        )
                      : decks.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.style_outlined,
                                    size: 64,
                                    color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No decks yet',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeHelper.getTextColor(widget.isDarkMode),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tap + to create your first deck',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: decks.length,
                              itemBuilder: (context, index) {
                                final deck = decks[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: _buildDeckCard(deck),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeckCard(Map<String, dynamic> deck) {
    final deckId = deck['id'] as String;
    final deckName = deck['deck_name'] as String;
    final isFavorites = customDeckService.isFavoritesDeck(deck); // ADDED

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isFavorites // ADDED: Special gradient for Favorites
              ? [const Color(0xFFFF6B9D), const Color(0xFFC94A7D)]
              : ThemeHelper.getSecondaryButtonGradient(widget.isDarkMode).colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            // Check if deck has questions
            final questions = await customDeckService.getQuestionsForGame(deckId);
            
            if (!mounted) return;
            
            // FIXED: Validate minimum 5 questions
            if (questions.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorites 
                        ? 'No favorite questions yet. Heart questions during gameplay to add them!'
                        : 'This deck has no questions. Add some first!',
                    style: GoogleFonts.poppins(),
                  ),
                  action: isFavorites ? null : SnackBarAction(
                    label: 'Add Questions',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionEditorPage(
                            deckId: deckId,
                            deckName: deckName,
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (questions.length < 5) {
              // FIXED: New validation for minimum 5 questions
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You need at least 5 questions to play. Currently: ${questions.length}/5',
                    style: GoogleFonts.poppins(),
                  ),
                  backgroundColor: Colors.orange,
                  action: isFavorites ? null : SnackBarAction(
                    label: 'Add More',
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionEditorPage(
                            deckId: deckId,
                            deckName: deckName,
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
                      );
                    },
                  ),
                  duration: const Duration(seconds: 4),
                ),
              );
            } else {
              // Navigate to game with custom questions
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePage(
                    gameMode: 'personal',
                    category: deckName,
                    isDarkMode: widget.isDarkMode,
                    customQuestions: questions,
                  ),
                ),
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  isFavorites ? Icons.favorite : Icons.style, // ADDED: Heart icon for Favorites
                  size: 32,
                  color: Colors.white, // ADDED: Always white for favorites
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deckName,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white, // ADDED: Always white for favorites
                        ),
                      ),
                      const SizedBox(height: 4),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: customDeckService.getDeckQuestions(deckId),
                        builder: (context, snapshot) {
                          final count = snapshot.data?.length ?? 0;
                          // FIXED: Show visual indicator of 5 question minimum
                          final hasEnough = count >= 5;
                          
                          return Row(
                            children: [
                              Text(
                                '$count question${count != 1 ? 's' : ''}',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.white.withValues(alpha: 0.9), // ADDED
                                ),
                              ),
                              if (count > 0 && count < 5) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    'Need ${5 - count} more',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange[800],
                                    ),
                                  ),
                                ),
                              ],
                              if (hasEnough) ...[
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // ADDED: Only show edit/delete for non-Favorites decks
                if (!isFavorites) ...[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionEditorPage(
                            deckId: deckId,
                            deckName: deckName,
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
                      ).then((_) => setState(() {}));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: ThemeHelper.getSecondaryButtonTextColor(widget.isDarkMode),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _deleteDeck(deckId, deckName),
                    icon: Icon(
                      Icons.delete,
                      color: ThemeHelper.getSecondaryButtonTextColor(widget.isDarkMode),
                    ),
                  ),
                ] else ...[
                  // ADDED: View-only button for Favorites
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionEditorPage(
                            deckId: deckId,
                            deckName: deckName,
                            isDarkMode: widget.isDarkMode,
                            isFavorites: true, // ADDED: Pass flag
                          ),
                        ),
                      ).then((_) => setState(() {}));
                    },
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                    tooltip: 'View favorites',
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}