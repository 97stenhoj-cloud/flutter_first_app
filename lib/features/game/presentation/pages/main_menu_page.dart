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
import 'package:connect/core/utils/page_transitions.dart';
import '../../../../core/services/auth_service.dart';
import '../../../auth/presentation/pages/social_auth_page.dart';
import '../../../../core/widgets/custom_dialog.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final authService = AuthService();

  void _showSignInRequiredDialog(bool isDarkMode) {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: isDarkMode,
        icon: Icons.login,
        iconColor: const Color(0xFFD4A574),
        title: l10n.signInRequired,
        content: l10n.signInToSync,
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context),
            isPrimary: false,
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.signInSignUp,
            onPressed: () async {
              Navigator.pop(context); // Close dialog
              
              // Navigate to sign-in page
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SocialAuthPage(isDarkMode: isDarkMode),
                ),
              );
              
              // After returning from sign-in, check if user logged in
              if (mounted && authService.isLoggedIn) {
                // User signed in successfully, navigate to game mode selection
                if (context.mounted) {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      builder: (context) => GameModeSelectionPage(isDarkMode: isDarkMode),
                    ),
                  );
                }
              }
            },
            isPrimary: true,
            isDarkMode: isDarkMode,
            icon: Icons.login,
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeNotifier = ThemeProvider.of(context);
    final isDarkMode = themeNotifier.isDarkMode;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode),
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
                            SlidePageRoute(
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
                      // Logo from Supabase storage
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
                                  ThemeHelper.buildLayeredButton(
                                    text: l10n.start,
                                    onPressed: () {
                                      // Check if user is logged in
                                      if (!authService.isLoggedIn) {
                                        _showSignInRequiredDialog(isDarkMode);
                                      } else {
                                        Navigator.push(
                                          context,
                                          SlidePageRoute(
                                            builder: (context) => GameModeSelectionPage(isDarkMode: isDarkMode),
                                          ),
                                        );
                                      }
                                    },
                                    isPrimary: true,
                                    isDarkMode: isDarkMode,
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // SETTINGS Button - SECONDARY (Beige to Clay)
                                  ThemeHelper.buildLayeredButton(
                                    text: l10n.settings,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        SlidePageRoute(
                                          builder: (context) => SettingsMainPage(isDarkMode: isDarkMode),
                                        ),
                                      );
                                    },
                                    isPrimary: false,
                                    isDarkMode: isDarkMode,
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // HOW TO PLAY Button - SECONDARY (Beige to Clay)
                                  ThemeHelper.buildLayeredButton(
                                    text: l10n.howToPlay,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        SlidePageRoute(
                                          builder: (context) => RulesPage(isDarkMode: isDarkMode),
                                        ),
                                      );
                                    },
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