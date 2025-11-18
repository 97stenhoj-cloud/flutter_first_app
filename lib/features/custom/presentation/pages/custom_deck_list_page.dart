// lib/features/custom/presentation/pages/custom_deck_list_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/services/custom_deck_service.dart';
import '../../../../../core/services/connectivity_service.dart';
import '../../../../../core/utils/theme_helper.dart';
import 'question_editor_page.dart';
import '../../../game/presentation/pages/game_page.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../spark/presentation/pages/spark_creator_screen.dart';
import '../../../../core/widgets/custom_dialog.dart';

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
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.add_circle_outline,
        iconColor: const Color(0xFF9C27B0),
        title: l10n.createNewDeck,
        contentWidget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: l10n.deckNameHint,
              filled: true,
              fillColor: widget.isDarkMode
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            style: GoogleFonts.poppins(
              color: ThemeHelper.getTextColor(widget.isDarkMode),
            ),
            autofocus: true,
          ),
        ),
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context),
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.create,
            onPressed: () => Navigator.pop(context, controller.text),
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.add,
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
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.red,
        title: l10n.deleteDeck,
        content: l10n.deleteDeckConfirmation(deckName),
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context, false),
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.delete,
            onPressed: () => Navigator.pop(context, true),
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            customColor: Colors.red,
            icon: Icons.delete,
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
Future<void> _renameDeck(String deckId, String currentName) async {
  final l10n = AppLocalizations.of(context)!;
  final controller = TextEditingController(text: currentName);

  final newName = await showDialog<String>(
    context: context,
    builder: (context) => CustomDialog(
      isDarkMode: widget.isDarkMode,
      icon: Icons.drive_file_rename_outline,
      iconColor: const Color(0xFF9C27B0),
      title: l10n.renameDeck,
      contentWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: l10n.deckNameHint,
            filled: true,
            fillColor: widget.isDarkMode
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: GoogleFonts.poppins(
            color: ThemeHelper.getTextColor(widget.isDarkMode),
          ),
          autofocus: true,
        ),
      ),
      actions: [
        DialogButton(
          text: l10n.cancel,
          onPressed: () => Navigator.pop(context),
          isPrimary: false,
          isDarkMode: widget.isDarkMode,
        ),
        const SizedBox(height: 12),
        DialogButton(
          text: l10n.save,
          onPressed: () => Navigator.pop(context, controller.text),
          isPrimary: true,
          isDarkMode: widget.isDarkMode,
          icon: Icons.save,
        ),
      ],
    ),
  );

  if (newName != null && newName.isNotEmpty && newName != currentName) {
    try {
      await customDeckService.renameDeck(deckId, newName);
      _loadDecks();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.deckRenamed, style: GoogleFonts.poppins()),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.failedToRenameDeck, style: GoogleFonts.poppins()),
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
                    Expanded(
                      child: Text(
                        l10n.customDecks,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // AI Deck Creation Button
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                // Check internet connection - Spark Mode requires online access
                                final hasInternet = await ConnectivityService.hasInternetConnection();
                                if (!hasInternet && mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomDialog(
                                      isDarkMode: widget.isDarkMode,
                                      icon: Icons.wifi_off,
                                      iconColor: Colors.orange,
                                      title: 'Spark Mode Requires Internet',
                                      content: 'Spark Mode uses AI to generate personalized questions and requires an active internet connection. Please connect to the internet and try again.',
                                      actions: [
                                        DialogButton(
                                          text: 'OK',
                                          onPressed: () => Navigator.pop(context),
                                          isPrimary: true,
                                          isDarkMode: widget.isDarkMode,
                                        ),
                                      ],
                                    ),
                                  );
                                  return;
                                }

                                // Navigate to Spark Mode for AI question generation
                                if (mounted) {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SparkCreatorScreen(
                                        isDarkMode: widget.isDarkMode,
                                      ),
                                    ),
                                  );
                                  // Refresh decks in case any questions were favorited
                                  _loadDecks();
                                }
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Manual Deck Creation Button
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
        label: l10n.addMore,
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
                                l10n.questionCount(count),
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
                                    l10n.needMore(5 - count),
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
                PopupMenuButton<String>(
  onSelected: (value) {
    if (value == 'edit') {
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
    } else if (value == 'rename') {
      _renameDeck(deckId, deckName);
    }
  },
  icon: const Icon(
    Icons.more_vert,
    size: 20,
    color: Colors.white,
  ),
  padding: EdgeInsets.zero,
  itemBuilder: (context) => [
    PopupMenuItem(
      value: 'edit',
      child: Row(
        children: [
          const Icon(Icons.edit, size: 20),
          const SizedBox(width: 12),
          Text(l10n.editQuestions, style: GoogleFonts.poppins()),
        ],
      ),
    ),
    PopupMenuItem(
      value: 'rename',
      child: Row(
        children: [
          const Icon(Icons.drive_file_rename_outline, size: 20),
          const SizedBox(width: 12),
          Text(l10n.renameDeck, style: GoogleFonts.poppins()),
        ],
      ),
    ),
  ],
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