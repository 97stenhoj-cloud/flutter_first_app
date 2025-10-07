import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import 'category_selection_page.dart';

class GameModeSelectionPage extends StatelessWidget {
  final int playerCount;
  final bool isDarkMode;
  
  const GameModeSelectionPage({
    super.key, 
    required this.playerCount,
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
    
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outermost layer
        Container(
          width: AppConstants.largButtonWidth,
          height: AppConstants.largButtonHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // Middle layer
        Container(
          width: AppConstants.largButtonWidth - 8,
          height: AppConstants.largButtonHeight - 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors[0].withValues(alpha: 0.85),
                colors[1].withValues(alpha: 0.85)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // Innermost layer (button)
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: Text(emoji, style: const TextStyle(fontSize: 24)),
            label: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                AppConstants.largButtonWidth - 16,
                AppConstants.largButtonHeight - 16,
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ThemeHelper.getSecondaryGradient(isDarkMode),
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.defaultPadding),
                      child: Column(
                        children: [
                          // Back button
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back, 
                                color: ThemeHelper.getTextColor(isDarkMode), 
                                size: 28
                              ),
                            ),
                          ),
                          
                          // Main content - centered vertically
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Choose your game mode',
                                    style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeHelper.getTextColor(isDarkMode),
                                      shadows: [
                                        Shadow(
                                          offset: const Offset(0, 0),
                                          blurRadius: 10,
                                          color: ThemeHelper.getTextColor(isDarkMode).withValues(alpha: 0.5),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 50),
                                  
                                  // Family Mode
                                  _buildLayeredGameModeButton(
                                    text: 'Family',
                                    emoji: '☕',
                                    onPressed: () => _selectMode(context, AppConstants.familyMode),
                                    gameMode: 'family',
                                    isDarkMode: isDarkMode,
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // Couple Mode
                                  _buildLayeredGameModeButton(
                                    text: 'Couple',
                                    emoji: '💋',
                                    onPressed: () => _selectMode(context, AppConstants.coupleMode),
                                    gameMode: 'couple',
                                    isDarkMode: isDarkMode,
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // Friends Mode
                                  _buildLayeredGameModeButton(
                                    text: 'Friends',
                                    emoji: '🎉',
                                    onPressed: () => _selectMode(context, AppConstants.friendsMode),
                                    gameMode: 'friends',
                                    isDarkMode: isDarkMode,
                                  ),
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
            },
          ),
        ),
      ),
    );
  }

  void _selectMode(BuildContext context, String mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategorySelectionPage(
          playerCount: playerCount,
          gameMode: mode,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}