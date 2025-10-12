// lib/features/settings/presentation/pages/settings_main_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import 'profile_page.dart';
import 'language_page.dart';
import 'credits_page.dart';
import 'package:connect/l10n/app_localizations.dart';
import 'package:connect/core/utils/page_transitions.dart';

class SettingsMainPage extends StatelessWidget {
  final bool isDarkMode;
  
  const SettingsMainPage({super.key, required this.isDarkMode});

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
              children: [
                // Header with back button
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getHeadingTextColor(isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      l10n.settings,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getHeadingTextColor(isDarkMode),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                
                // Settings options
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile Button
                      ThemeHelper.buildLayeredButton(
                        text: l10n.profile,
                        icon: Icons.person,
                        onPressed: () => Navigator.push(
                          context,
                          SlidePageRoute(
                            builder: (context) => ProfilePage(isDarkMode: isDarkMode),
                          ),
                        ),
                        isPrimary: false,
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 20),
                      
                      // Language Button
                      ThemeHelper.buildLayeredButton(
                        text: l10n.language,
                        icon: Icons.language,
                        onPressed: () => Navigator.push(
                          context,
                          SlidePageRoute(
                            builder: (context) => LanguagePage(isDarkMode: isDarkMode),
                          ),
                        ),
                        isPrimary: false,
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 20),
                      
                      // About/Credits Button
                      ThemeHelper.buildLayeredButton(
                        text: l10n.aboutCredits,
                        icon: Icons.info_outline,
                        onPressed: () => Navigator.push(
                          context,
                          SlidePageRoute(
                            builder: (context) => CreditsPage(isDarkMode: isDarkMode),
                          ),
                        ),
                        isPrimary: false,
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