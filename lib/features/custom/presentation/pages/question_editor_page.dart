// lib/features/custom/presentation/pages/question_editor_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/services/custom_deck_service.dart';
import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../l10n/app_localizations.dart';

class QuestionEditorPage extends StatefulWidget {
  final String deckId;
  final String deckName;
  final bool isDarkMode;
  final bool isFavorites; // ADDED

  const QuestionEditorPage({
    super.key,
    required this.deckId,
    required this.deckName,
    required this.isDarkMode,
    this.isFavorites = false, // ADDED
  });

  @override
  State<QuestionEditorPage> createState() => _QuestionEditorPageState();
}

class _QuestionEditorPageState extends State<QuestionEditorPage> {

  final customDeckService = CustomDeckService();
  List<Map<String, dynamic>> questions = [];
  bool isLoading = true;
  bool isShuffled = false; // ADDED: Track shuffle state

  // Minimum questions constant for display purposes only
  static const int minimumQuestions = 5;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final fetchedQuestions = await customDeckService.getDeckQuestions(widget.deckId);
      setState(() {
        questions = fetchedQuestions;
        isLoading = false;
        isShuffled = false; // Reset shuffle state on reload
      });
    } catch (e) {
      debugPrint('Error loading questions: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // ADDED: Shuffle questions
  void _shuffleQuestions() {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      questions.shuffle();
      isShuffled = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.questionsShuffled, style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ADDED: Reset to original order
  void _resetOrder() {
    _loadQuestions(); // Reload from database to get original order
      final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.orderReset, style: GoogleFonts.poppins()),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ADDED: Reorder questions
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = questions.removeAt(oldIndex);
      questions.insert(newIndex, item);
    });
  }

  Future<void> _addQuestion() async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    final questionText = await showDialog<String>(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.add_circle_outline,
        iconColor: const Color(0xFFFF6B9D),
        title: l10n.addQuestion,
        contentWidget: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: l10n.enterYourQuestion,
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
            color: widget.isDarkMode ? Colors.white : Colors.black87,
          ),
          maxLines: 3,
          autofocus: true,
        ),
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context),
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.add,
            onPressed: () => Navigator.pop(context, controller.text),
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.add,
          ),
        ],
      ),
    );

    if (questionText != null && questionText.isNotEmpty) {
      try {
        await customDeckService.addQuestion(widget.deckId, questionText);
        _loadQuestions();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.questionAdded, style: GoogleFonts.poppins()),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.failedToAddQuestion, style: GoogleFonts.poppins()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _editQuestion(String questionId, String currentText) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: currentText);

    final newText = await showDialog<String>(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.edit,
        iconColor: const Color(0xFFFF6B9D),
        title: l10n.editQuestion,
        contentWidget: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: l10n.enterYourQuestion,
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
            color: widget.isDarkMode ? Colors.white : Colors.black87,
          ),
          maxLines: 3,
          autofocus: true,
        ),
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context),
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

    if (newText != null && newText.isNotEmpty && newText != currentText) {
      try {
        await customDeckService.updateQuestion(questionId, newText);
        _loadQuestions();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.questionUpdated, style: GoogleFonts.poppins()),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.failedToUpdateQuestion, style: GoogleFonts.poppins()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _deleteQuestion(String questionId) async {
    final l10n = AppLocalizations.of(context)!;
    // FIXED: Removed the restriction - allow deletion at any count
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.delete_outline,
        iconColor: Colors.red,
        title: l10n.deleteQuestion,
        content: l10n.deleteQuestionConfirm,
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context, false),
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
        await customDeckService.deleteQuestion(questionId);
        _loadQuestions();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.questionDeleted, style: GoogleFonts.poppins()),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.failedToDeleteQuestion, style: GoogleFonts.poppins()),
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
    final hasEnoughQuestions = questions.length >= minimumQuestions;
    final questionsNeeded = minimumQuestions - questions.length;

    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.deckName,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${questions.length} question${questions.length != 1 ? 's' : ''}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (!hasEnoughQuestions && questions.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        size: 14,
                                        color: Colors.orange[800],
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Need $questionsNeeded more',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.orange[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              else if (hasEnoughQuestions)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        size: 14,
                                        color: Colors.green[800],
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                       l10n.readyToPlay,
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ADDED: Shuffle button
                    if (questions.length > 1)
                      IconButton(
                        onPressed: isShuffled ? _resetOrder : _shuffleQuestions,
                        icon: Icon(
                          isShuffled ? Icons.refresh : Icons.shuffle,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          size: 24,
                        ),
                        tooltip: isShuffled ? l10n.resetOrder : l10n.shuffleQuestions,
                      ),
                  ],
                ),
                const SizedBox(height: 20),

                // Informational banner for minimum requirement
                if (!hasEnoughQuestions)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: widget.isFavorites // ADDED
                          ? Colors.pink.withValues(alpha: 0.1)
                          : Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: widget.isFavorites // ADDED
                            ? Colors.pink.withValues(alpha: 0.3)
                            : Colors.blue.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          widget.isFavorites ? Icons.favorite : Icons.info_outline, // ADDED
                          color: widget.isFavorites ? Colors.pink[700] : Colors.blue[700], // ADDED
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.isFavorites // ADDED
                                ? l10n.heartQuestionsInfo
                                : l10n.addAtLeastQuestionsToPlay(minimumQuestions.toString()),
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: widget.isDarkMode 
                                  ? (widget.isFavorites ? Colors.pink[200] : Colors.blue[200])
                                  : (widget.isFavorites ? Colors.pink[900] : Colors.blue[900]),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Add Question Button - HIDDEN for Favorites
                if (!widget.isFavorites)
                  ThemeHelper.buildLayeredButton(
                    text: '${l10n.addQuestion}',
                    icon: Icons.add,
                    onPressed: _addQuestion,
                    isPrimary: true,
                    isDarkMode: widget.isDarkMode,
                  ),
                if (!widget.isFavorites) const SizedBox(height: 16),

                // ADDED: Reorder instructions
                if (questions.length > 1)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.drag_handle,
                          size: 16,
                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.longPressReorder,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Questions List - CHANGED to ReorderableListView
                Expanded(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          ),
                        )
                      : questions.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    widget.isFavorites ? Icons.favorite_border : Icons.question_answer, // ADDED
                                    size: 80,
                                    color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    widget.isFavorites ? l10n.noFavoritesYet : l10n.noQuestionsYet, // ADDED
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.isFavorites // ADDED
                                            ? l10n.heartQuestionsDuringGameplay
                                           : l10n.addAtLeastQuestions(minimumQuestions.toString()),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : ReorderableListView.builder(
                              onReorder: _onReorder,
                              itemCount: questions.length,
                              itemBuilder: (context, index) {
                                final question = questions[index];
                                return Padding(
                                  key: ValueKey(question['id']),
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: _buildQuestionCard(question, index + 1),
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

  Widget _buildQuestionCard(Map<String, dynamic> question, int number) {
    final questionId = question['id'] as String;
    final questionText = question['question_text'] as String;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: widget.isDarkMode ? 0.1 : 0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ADDED: Drag handle for reordering
            Icon(
              Icons.drag_handle,
              color: widget.isDarkMode ? Colors.white54 : Colors.black45,
              size: 20,
            ),
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: ThemeHelper.getPrimaryButtonGradient(widget.isDarkMode).colors.first,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                questionText,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: widget.isDarkMode ? Colors.white : Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
            // MODIFIED: Only show edit button for non-Favorites
            if (!widget.isFavorites)
              IconButton(
                onPressed: () => _editQuestion(questionId, questionText),
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: widget.isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            // Always allow deletion
            IconButton(
              onPressed: () => _deleteQuestion(questionId),
              icon: Icon(
                Icons.delete,
                size: 20,
                color: widget.isDarkMode ? Colors.white70 : Colors.black54,
              ),
              tooltip: widget.isFavorites ? l10n.removeFromFavorites : l10n.deleteQuestion,
            ),
          ],
        ),
      ),
    );
  }
}