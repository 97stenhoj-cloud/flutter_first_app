import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';

class QuestionPicker extends StatelessWidget {
  final List<String> questions;
  final int currentIndex;
  final bool isDarkMode;
  final Function(int) onQuestionSelected;

  const QuestionPicker({
    super.key,
    required this.questions,
    required this.currentIndex,
    required this.isDarkMode,
    required this.onQuestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2D1B2E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.1),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.selectQuestion,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Question list
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final question = questions[index];
                final isCurrentQuestion = index == currentIndex;

                final words = question.split(' ');
                final displayText = words.length > 4
                    ? '${words.take(4).join(' ')}...'
                    : question;

                return GestureDetector(
                  onTap: () {
                    onQuestionSelected(index);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isCurrentQuestion
                          ? (isDarkMode
                              ? const Color(0xFFFF6B9D).withValues(alpha: 0.3)
                              : const Color(0xFFFF6B9D).withValues(alpha: 0.1))
                          : (isDarkMode
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.black.withValues(alpha: 0.03)),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isCurrentQuestion
                            ? const Color(0xFFFF6B9D)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Question number
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isCurrentQuestion
                                ? const Color(0xFFFF6B9D)
                                : (isDarkMode
                                    ? Colors.white.withValues(alpha: 0.1)
                                    : Colors.black.withValues(alpha: 0.1)),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isCurrentQuestion
                                    ? Colors.white
                                    : (isDarkMode
                                        ? Colors.white
                                        : Colors.black87),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Question text
                        Expanded(
                          child: Text(
                            displayText,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: isDarkMode ? Colors.white : Colors.black87,
                              fontWeight: isCurrentQuestion
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Check icon
                        if (isCurrentQuestion)
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFFFF6B9D),
                            size: 24,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
