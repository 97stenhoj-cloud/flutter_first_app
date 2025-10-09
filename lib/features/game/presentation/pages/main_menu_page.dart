// lib/features/game/presentation/pages/main_menu_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/theme_notifier.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../settings/presentation/pages/settings_main_page.dart';
import '../../../settings/presentation/pages/rules_page.dart';
import '../../../settings/presentation/pages/profile_page.dart';
import 'game_mode_selection_page.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  Widget _buildLayeredButton({
    required String text,
    required VoidCallback onPressed,
    required List<Color> colors,
    required bool isPrimary,
    required bool isDarkMode,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outermost layer
        Container(
          width: AppConstants.buttonWidth,
          height: AppConstants.buttonHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors[0], colors[1]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isDarkMode 
                    ? const Color.fromRGBO(0, 0, 0, 0.4)
                    : const Color.fromRGBO(100, 80, 60, 0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        // Middle layer
        Container(
          width: AppConstants.buttonWidth - 8,
          height: AppConstants.buttonHeight - 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors[0].withValues(alpha: 0.85), colors[1].withValues(alpha: 0.85)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Innermost layer (button)
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: AppConstants.buttonWidth - 16,
              height: AppConstants.buttonHeight - 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: isPrimary ? 18 : 16,
                  fontWeight: isPrimary ? FontWeight.bold : FontWeight.w600,
                  color: isPrimary 
                      ? Colors.white
                      : ThemeHelper.getSecondaryButtonTextColor(isDarkMode),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeNotifier = ThemeProvider.of(context);
    final isDarkMode = themeNotifier.isDarkMode;
    
    // Get the new theme colors
    final primaryGradient = ThemeHelper.getPrimaryButtonGradient(isDarkMode);
    final secondaryGradient = ThemeHelper.getSecondaryButtonGradient(isDarkMode);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-1, -1), // 135 degrees
            end: const Alignment(1, 1),      // 135 degrees
            colors: ThemeHelper.getMainMenuGradient(isDarkMode),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                // Top bar with profile and theme toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile button
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeHelper.getCardColor(isDarkMode).withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(isDarkMode: isDarkMode),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.person,
                          color: ThemeHelper.getBodyTextColor(isDarkMode),
                          size: 24,
                        ),
                        tooltip: l10n.profile,
                      ),
                    ),
                    // Theme toggle button
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeHelper.getCardColor(isDarkMode).withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          themeNotifier.toggleTheme();
                        },
                        icon: Icon(
                          isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: ThemeHelper.getBodyTextColor(isDarkMode),
                          size: 24,
                        ),
                        tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                      ),
                    ),
                  ],
                ),
                
                // Main content
                Expanded(
                  child: Column(
                    children: [
                      // Logo at top - keeping your Supabase logo
                      const SizedBox(height: 20),
                      Image.network(
                        'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/AppIcon/AppIcon.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                        cacheWidth: 200,
                        cacheHeight: 200,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 200,
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                                color: ThemeHelper.getHeadingTextColor(isDarkMode),
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint('Error loading logo: $error');
                          return Icon(
                            Icons.chat_bubble, 
                            size: 100, 
                            color: ThemeHelper.getHeadingTextColor(isDarkMode),
                          );
                        },
                      ),
                      
                      // Negative space to overlap with logo's transparent area
                      Transform.translate(
                        offset: const Offset(0, -40),
                        child: Column(
                          children: [
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // App Title
                                  Text(
                                    l10n.appTitle,
                                    style: GoogleFonts.poppins(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeHelper.getHeadingTextColor(isDarkMode),
                                      shadows: [
                                        Shadow(
                                          offset: const Offset(0, 0),
                                          blurRadius: 10,
                                          color: ThemeHelper.getHeadingTextColor(isDarkMode).withValues(alpha: 0.3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                  
                                  // START Button - PRIMARY (Rose to Peachy Coral)
                                  _buildLayeredButton(
                                    text: l10n.start,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GameModeSelectionPage(isDarkMode: isDarkMode),
                                        ),
                                      );
                                    },
                                    colors: primaryGradient.colors,
                                    isPrimary: true,
                                    isDarkMode: isDarkMode,
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // SETTINGS Button - SECONDARY (Beige to Clay)
                                  _buildLayeredButton(
                                    text: l10n.settings,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SettingsMainPage(isDarkMode: isDarkMode),
                                        ),
                                      );
                                    },
                                    colors: secondaryGradient.colors,
                                    isPrimary: false,
                                    isDarkMode: isDarkMode,
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // HOW TO PLAY Button - SECONDARY (Beige to Clay)
                                  _buildLayeredButton(
                                    text: l10n.howToPlay,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RulesPage(isDarkMode: isDarkMode),
                                        ),
                                      );
                                    },
                                    colors: secondaryGradient.colors,
                                    isPrimary: false,
                                    isDarkMode: isDarkMode,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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