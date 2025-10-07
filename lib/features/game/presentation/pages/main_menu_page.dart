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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // Middle layer
        Container(
          width: AppConstants.buttonWidth - 8,
          height: AppConstants.buttonHeight - 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors[0].withValues(alpha: 0.85), colors[1].withValues(alpha: 0.85)],
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
              colors: [
                Color.fromRGBO(245, 100, 105, 1),
                Color.fromRGBO(220, 75, 85, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(AppConstants.buttonWidth - 16, AppConstants.buttonHeight - 16),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
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
    
    List<Color> buttonColors = isDarkMode
        ? [const Color(0xFFAD1457), const Color(0xFF880E4F)]
        : [const Color(0xFFF8BBD9), const Color(0xFFF48FB1)];

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: ThemeHelper.getMainMenuGradient(isDarkMode),
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // Main content with scroll
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
                        child: Column(
                          children: [
                            // App bar with account and theme toggle
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Account icon (left)
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfilePage(isDarkMode: isDarkMode),
                                        ),
                                      ).then((_) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(
                                      Icons.account_circle,
                                      color: ThemeHelper.getTextColor(isDarkMode),
                                      size: 28,
                                    ),
                                    tooltip: 'Profile',
                                  ),
                                  // App title (center)
                                  Text(
                                    l10n.appTitle,
                                    style: GoogleFonts.poppins(
                                      color: ThemeHelper.getTextColor(isDarkMode),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Theme toggle (right)
                                  IconButton(
                                    onPressed: () {
                                      themeNotifier.toggleTheme();
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                      color: ThemeHelper.getTextColor(isDarkMode),
                                      size: 28,
                                    ),
                                    tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                                  ),
                                ],
                              ),
                            ),
                            
                            // Main content - centered vertically
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // Logo above title (5x bigger - 250x250)
                                    Image.network(
                                      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/AppIcon/AppIcon.png',
                                      width: 250,
                                      height: 250,
                                      fit: BoxFit.contain,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return SizedBox(
                                          width: 250,
                                          height: 250,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                  : null,
                                              color: ThemeHelper.getTextColor(isDarkMode),
                                              strokeWidth: 3,
                                            ),
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.chat_bubble, 
                                          size: 250, 
                                          color: ThemeHelper.getTextColor(isDarkMode),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    
                                    // App Title below logo
                                    Text(
                                      l10n.appTitle,
                                      style: GoogleFonts.poppins(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeHelper.getTextColor(isDarkMode),
                                        shadows: [
                                          Shadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 20,
                                            color: ThemeHelper.getTextColor(isDarkMode).withValues(alpha: 0.5),
                                          ),
                                          const Shadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                            color: Colors.black45,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    
                                    // Start Button
                                    _buildLayeredButton(
                                      text: l10n.start,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GameModeSelectionPage(
                                              playerCount: 2,
                                              isDarkMode: isDarkMode,
                                            ),
                                          ),
                                        );
                                      },
                                      colors: buttonColors,
                                    ),
                                    const SizedBox(height: 20),
                                    
                                    // Settings Button
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
                                      colors: buttonColors,
                                    ),
                                    const SizedBox(height: 20),
                                    
                                    // How to Play Button
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
                                      colors: buttonColors,
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
        ],
      ),
    );
  }
}