// lib/features/game/presentation/pages/game_mode_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import 'category_selection_page.dart';
import '../../../pandora/presentation/pages/pandora_entry_page.dart';

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
    
    // Adjusted button sizes to fit 5 buttons
    const double buttonWidth = 360;
    const double buttonHeight = 100.0;  // Reduced from 110 to 100
    
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
                  style: const TextStyle(fontSize: 32),  // Reduced from 36 to 32
                ),
                const SizedBox(height: 6),  // Reduced from 8 to 6
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 18,  // Reduced from 20 to 18
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
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back, 
                    color: ThemeHelper.getHeadingTextColor(isDarkMode), 
                    size: 28
                  ),
                ),
                
                const SizedBox(height: 20),  // Reduced from 40 to 20
                
                // Title text
                Center(
                  child: Text(
                    l10n.chooseGameMode,
                    style: GoogleFonts.poppins(
                      fontSize: 24,  // Reduced from 28 to 24
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getHeadingTextColor(isDarkMode),
                    ),
                  ),
                ),
              
                const SizedBox(height: 20),  // Reduced from 30 to 20
                
                // Game mode buttons - Now scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),  // Top padding
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
                        const SizedBox(height: 12),  // Reduced from 16 to 12
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
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 12),
                        _buildLayeredGameModeButton(
                          text: l10n.personal,
                          emoji: '📝',
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategorySelectionPage(
                                gameMode: 'personal',
                                isDarkMode: isDarkMode,
                              ),
                            ),
                          ),
                          gameMode: 'personal',
                          isDarkMode: isDarkMode,
                        ),
                        const SizedBox(height: 12),
                        _buildLayeredGameModeButton(
                          text: 'Pandora',
                          emoji: '🔮',  // Changed from 📦 to 🔮
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PandoraEntryPage(isDarkMode: isDarkMode),
                            ),
                          ),
                          gameMode: 'pandora',
                          isDarkMode: isDarkMode,
                        ),
                        const SizedBox(height: 10),  // Bottom padding
                      ],
                    ),
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