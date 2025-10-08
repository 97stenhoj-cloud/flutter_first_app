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
    
    return Stack(
      alignment: Alignment.center,
      children: [
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
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                AppConstants.largButtonWidth - 16,
                AppConstants.largButtonHeight - 16,
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  emoji,
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 12),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getTextColor(isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Text(
                        l10n.chooseGameMode,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getTextColor(isDarkMode),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLayeredGameModeButton(
                          text: l10n.family,
                          emoji: '👨‍👩‍👧‍👦',
                          onPressed: () => _selectMode(context, AppConstants.familyMode),
                          gameMode: 'family',
                          isDarkMode: isDarkMode,
                        ),
                        const SizedBox(height: 20),
                        
                        _buildLayeredGameModeButton(
                          text: l10n.couple,
                          emoji: '💋',
                          onPressed: () => _selectMode(context, AppConstants.coupleMode),
                          gameMode: 'couple',
                          isDarkMode: isDarkMode,
                        ),
                        const SizedBox(height: 20),
                        
                        _buildLayeredGameModeButton(
                          text: l10n.friends,
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
  }

  void _selectMode(BuildContext context, String mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategorySelectionPage(
          gameMode: mode,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}