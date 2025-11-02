// lib/features/custom/presentation/pages/custom_deck_list_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/services/custom_deck_service.dart';
import '../../../../../core/utils/theme_helper.dart';
import 'question_editor_page.dart';
import '../../../game/presentation/pages/game_page.dart';
import '../../../../l10n/app_localizations.dart';

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
    
    // Sort decks: Favorites first, then others by created_at
    fetchedDecks.sort((a, b) {
      final aIsFavorites = customDeckService.isFavoritesDeck(a);
      final bIsFavorites = customDeckService.isFavoritesDeck(b);
      
      // Favorites always comes first
      if (aIsFavorites && !bIsFavorites) return -1;
      if (!aIsFavorites && bIsFavorites) return 1;
      
      // For non-favorites, sort by created_at (newest first)
      final aCreated = DateTime.parse(a['created_at'] as String);
      final bCreated = DateTime.parse(b['created_at'] as String);
      return bCreated.compareTo(aCreated);
    });
    
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
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    final deckName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.createNewDeck, style: GoogleFonts.poppins()),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: l10n.deckNameHint,
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel, style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text(l10n.create, style: GoogleFonts.poppins()),
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
              content: Text(l10n.deckCreatedSuccess, style: GoogleFonts.poppins()),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.failedToCreateDeck, style: GoogleFonts.poppins()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _deleteDeck(String deckId, String deckName) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteDeck, style: GoogleFonts.poppins()),
        content: Text(
          'Are you sure you want to delete "$deckName"? This will delete all questions in this deck.',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel, style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(l10n.delete, style: GoogleFonts.poppins()),
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
              content: Text(l10n.deckDeleted, style: GoogleFonts.poppins()),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.failedToDeleteDeck, style: GoogleFonts.poppins()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                      l10n.customDecks,
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
                                    l10n.noDecksYet,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeHelper.getTextColor(widget.isDarkMode),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    l10n.createFirstDeckMessage,
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
  final isFavorites = customDeckService.isFavoritesDeck(deck);
  final l10n = AppLocalizations.of(context)!;
  // Determine gradient colors based on deck type
  final List<Color> gradientColors = isFavorites
    ? (widget.isDarkMode
        ? [const Color(0xFFD85E72), const Color(0xFFC4405A)] // Night mode - Favorites (muted rose red → deep rose)
        : [const Color(0xFFFF9BA8), const Color(0xFFFF6B85)]) // Day mode - Favorites (soft pink red → vibrant coral red)
    : (widget.isDarkMode
        ? [const Color(0xFF6C92A3), const Color(0xFF547A8D)] // Night mode - User decks
        : [const Color(0xFFB9D9E8), const Color(0xFFA4C8E0)]); // Day mode - User decks
  return Container(
    height: 76.0, // Increased from 68 to accommodate content
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(14),
      boxShadow: ThemeHelper.getButtonShadow(widget.isDarkMode),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          // Get questions for this deck
          final questions = await customDeckService.getDeckQuestions(deckId);
          final questionTexts = questions.map((q) => q['question_text'] as String).toList();

          if (questionTexts.length < 5) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        l10n.notEnoughQuestions(questionTexts.length.toString()),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GamePage(
                  gameMode: 'personal',
                  category: deckName,
                  isDarkMode: widget.isDarkMode,
                  customQuestions: questionTexts,
                ),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Reduced horizontal padding
          child: Row(
            children: [
              Icon(
                isFavorites ? Icons.favorite : Icons.style,
                size: 26, // Slightly reduced from 28
                color: Colors.white,
              ),
              const SizedBox(width: 12), // Reduced from 14
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Added to prevent overflow
                  children: [
                    Text(
                      deckName,
                      style: GoogleFonts.poppins(
                        fontSize: 15, // Reduced from 16
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: customDeckService.getDeckQuestions(deckId),
                      builder: (context, snapshot) {
                        final count = snapshot.data?.length ?? 0;
                        final hasEnough = count >= 5;
                        
                        return Row(
                          mainAxisSize: MainAxisSize.min, // Prevent overflow
                          children: [
                            Flexible(
                              child: Text(
                                '$count question${count != 1 ? 's' : ''}',
                                style: GoogleFonts.poppins(
                                  fontSize: 12, // Reduced from 13
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (!hasEnough) ...[
                              const SizedBox(width: 4), // Reduced from 6
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[800],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Need ${5 - count}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10, // Reduced from 11
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            if (hasEnough) ...[
                              const SizedBox(width: 4),
                              Icon(
                                Icons.check_circle,
                                size: 13, // Reduced from 14
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
              const SizedBox(width: 4), // Space between content and buttons
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
                    size: 20, // Reduced from 22
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () => _deleteDeck(deckId, deckName),
                  icon: Icon(
                    Icons.delete,
                    size: 20, // Reduced from 22
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ] else ...[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionEditorPage(
                          deckId: deckId,
                          deckName: deckName,
                          isDarkMode: widget.isDarkMode,
                          isFavorites: true,
                        ),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  icon: const Icon(
                    Icons.visibility,
                    size: 20, // Reduced from 22
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
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