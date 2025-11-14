import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/feedback_service.dart';
import '../../l10n/app_localizations.dart';

class RatingDialog extends StatefulWidget {
  final String categoryName;
  final String gameMode;
  final bool isDarkMode;

  const RatingDialog({
    Key? key,
    required this.categoryName,
    required this.gameMode,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 0;
  final _feedbackService = FeedbackService();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Dialog(
      backgroundColor: widget.isDarkMode ? const Color(0xFF2D1B2E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.rateThisDeck,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.categoryName,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: widget.isDarkMode 
                    ? Colors.white.withValues(alpha: 0.7)
                    : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starNumber = index + 1;
                return IconButton(
                  icon: Icon(
                    starNumber <= _rating ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      _rating = starNumber;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _isSubmitting ? null : () => Navigator.pop(context),
                    child: Text(
                      l10n.skip,
                      style: GoogleFonts.poppins(
                        color: widget.isDarkMode 
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _rating == 0 || _isSubmitting
                        ? null
                        : _submitRating,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B9D),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            l10n.submit,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitRating() async {
    setState(() => _isSubmitting = true);

    try {
      await _feedbackService.rateDeck(
        categoryName: widget.categoryName,
        gameMode: widget.gameMode,
        rating: _rating,
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.thankYouForFeedback,
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.failedToSubmitRating,
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }
}

/// Helper function to show rating dialog
/// Returns immediately without showing dialog for Pandora or Personal modes
/// Helper function to show rating dialog
/// Returns immediately without showing dialog for Pandora or Personal modes
Future<void> showRatingDialog(
  BuildContext context, {
  required String categoryName,
  required String gameMode,
  required bool isDarkMode,
}) async {
  debugPrint('🎯 showRatingDialog called:');
  debugPrint('   - Category: $categoryName');
  debugPrint('   - Game Mode: $gameMode');
  debugPrint('   - Game Mode (lowercase): ${gameMode.toLowerCase()}');
  
  // Don't show rating dialog for Pandora (user-generated) or Personal (custom) modes
  if (gameMode.toLowerCase() == 'pandora' || gameMode.toLowerCase() == 'personal') {
    debugPrint('⏭️ Skipping rating dialog for $gameMode mode');
    return;
  }
  
  debugPrint('✅ Showing rating dialog!');
  
  return showDialog(
    context: context,
    builder: (context) => RatingDialog(
      categoryName: categoryName,
      gameMode: gameMode,
      isDarkMode: isDarkMode,
    ),
  );
}