// lib/features/game/presentation/pages/game_mode_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import 'category_selection_page.dart';

class GameModeSelectionPage extends StatelessWidget {
  final bool isDarkMode;
  
  const GameModeSelectionPage({
    super.key,
    required this.isDarkMode,
  });

  Widget _buildLayeredGameModeButton({
    required String text,
    required String emoji,
    required VoidCallback onPressed,
    required String gameMode,
    required bool isDarkMode,
  }) {
    final colors = ThemeHelper.getGameModeGradient(gameMode, isDarkMode);
    
    // Bigger button sizes
    const double buttonWidth = 360;
    const double buttonHeight = 132.0;
    
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outermost layer (shadow effect)
          Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: ThemeHelper.getButtonShadow(isDarkMode),
            ),
          ),
          // Middle layer (depth effect)
          Container(
            width: buttonWidth - 8,
            height: buttonHeight - 8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors[0].withValues(alpha: 0.85),
                  colors[1].withValues(alpha: 0.85)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Innermost layer (button content)
          Container(
            width: buttonWidth - 16,
            height: buttonHeight - 16,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  emoji,
                  style: const TextStyle(fontSize: 44),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode), // Use main background
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button ONLY - on its own
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back, 
                    color: ThemeHelper.getHeadingTextColor(isDarkMode), 
                    size: 28
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Title text - centered on its own line
                Center(
                  child: Text(
                    l10n.chooseGameMode,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getHeadingTextColor(isDarkMode),
                    ),
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // Game mode buttons
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLayeredGameModeButton(
                        text: l10n.couple,
                        emoji: '💑',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategorySelectionPage(
                              gameMode: 'couple',
                              isDarkMode: isDarkMode,
                            ),
                          ),
                        ),
                        gameMode: 'couple',
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 24),
                      _buildLayeredGameModeButton(
                        text: l10n.friends,
                        emoji: '👥',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategorySelectionPage(
                              gameMode: 'friends',
                              isDarkMode: isDarkMode,
                            ),
                          ),
                        ),
                        gameMode: 'friends',
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 24),
                      _buildLayeredGameModeButton(
                        text: l10n.family,
                        emoji: '👨‍👩‍👧‍👦',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategorySelectionPage(
                              gameMode: 'family',
                              isDarkMode: isDarkMode,
                            ),
                          ),
                        ),
                        gameMode: 'family',
                        isDarkMode: isDarkMode,
                      ),
                    ],
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