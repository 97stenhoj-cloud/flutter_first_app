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
    // FIXED: Removed unused l10n variable
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
    // FIXED: Removed unused l10n variable
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

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ThemeHelper.getSecondaryButtonGradient(widget.isDarkMode).colors,
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
            
            // FIXED: Check mounted before using context
            if (!mounted) return;
            
            if (questions.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'This deck has no questions. Add some first!',
                    style: GoogleFonts.poppins(),
                  ),
                  action: SnackBarAction(
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
            } else {
              // FIXED: Navigate to game with custom questions
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePage(
                    gameMode: 'personal',
                    category: deckName,
                    isDarkMode: widget.isDarkMode,
                    customQuestions: questions,  // FIXED: Now passing customQuestions parameter
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
                  Icons.style,
                  size: 32,
                  color: ThemeHelper.getSecondaryButtonTextColor(widget.isDarkMode),
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
                          color: ThemeHelper.getSecondaryButtonTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 4),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: customDeckService.getDeckQuestions(deckId),
                        builder: (context, snapshot) {
                          final count = snapshot.data?.length ?? 0;
                          return Text(
                            '$count question${count != 1 ? 's' : ''}',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: ThemeHelper.getSecondaryButtonTextColor(widget.isDarkMode)
                                  .withValues(alpha: 0.7),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}