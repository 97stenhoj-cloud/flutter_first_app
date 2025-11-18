import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/utils/theme_helper.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String gameMode;
  final String category;
  final bool isDarkMode;
  final String? logoUrl;
  final bool isPandoraMode;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const QuestionCard({
    super.key,
    required this.question,
    required this.gameMode,
    required this.category,
    required this.isDarkMode,
    this.logoUrl,
    required this.isPandoraMode,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  Map<String, String?> _parseQuestion(String question) {
    final regex = RegExp(r'^\[(.+?)\]\s*(.+)$');
    final match = regex.firstMatch(question);

    if (match != null) {
      return {
        'targetName': match.group(1),
        'questionText': match.group(2),
      };
    }

    return {
      'targetName': null,
      'questionText': question,
    };
  }

  @override
  Widget build(BuildContext context) {
    final parsed = _parseQuestion(question);
    final targetName = parsed['targetName'];
    final questionText = parsed['questionText'] ?? question;

    List<Color> cardGradient;
    const Color textColor = Colors.white;
    String? emoji;

    if (gameMode.toLowerCase() == 'pandora') {
      emoji = '🔮';
      cardGradient = ThemeHelper.getGameModeGradient('pandora', isDarkMode);
    } else if (gameMode.toLowerCase() == 'personal') {
      // Personal mode keeps its own logic
      final isFavoritesDeck = category.toLowerCase() == 'favorites';

      if (isFavoritesDeck) {
        cardGradient = isDarkMode
            ? [const Color(0xFFD85E72), const Color(0xFFC4405A)]
            : [const Color(0xFFFF9BA8), const Color(0xFFFF6B85)];
      } else {
        cardGradient = isDarkMode
            ? [const Color(0xFF6C92A3), const Color(0xFF547A8D)]
            : [const Color(0xFFB9D9E8), const Color(0xFFA4C8E0)];
      }
    } else {
      // Use ThemeHelper for Family, Couple, and Friends modes
      cardGradient = ThemeHelper.getGameModeGradient(gameMode, isDarkMode);
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: cardGradient,
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Stack(
            children: [
              // Logo or emoji at top
              if (emoji == null)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: logoUrl != null
                        ? CachedNetworkImage(
                            imageUrl: logoUrl!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) {
                              return const SizedBox.shrink();
                            },
                            placeholder: (context, url) => const SizedBox.shrink(),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),

              if (emoji != null)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 64),
                    ),
                  ),
                ),

              // Question text
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    questionText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      height: 1.5,
                      letterSpacing: 0.3,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),

              // Target name badge
              if (targetName != null)
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              targetName,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Favorite button
              if (!isPandoraMode)
                Positioned(
                  bottom: targetName != null ? 70 : 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: onFavoriteToggle,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 32,
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
