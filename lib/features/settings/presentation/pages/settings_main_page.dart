import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import 'profile_page.dart';
import 'language_page.dart';
import 'credits_page.dart';
import 'package:connect/l10n/app_localizations.dart';

class SettingsMainPage extends StatelessWidget {
  final bool isDarkMode;
  
  const SettingsMainPage({super.key, required this.isDarkMode});

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
                // Header with back button
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
                    const SizedBox(width: 16),
                    Text(
                      l10n.settings,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getTextColor(isDarkMode),
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
                      _buildSettingsButton(
                        context,
                        icon: Icons.person,
                        title: l10n.profile,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(isDarkMode: isDarkMode),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Language Button
                      _buildSettingsButton(
                        context,
                        icon: Icons.language,
                        title: l10n.language,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguagePage(isDarkMode: isDarkMode),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // About/Credits Button
                      _buildSettingsButton(
                        context,
                        icon: Icons.info_outline,
                        title: l10n.aboutCredits,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditsPage(isDarkMode: isDarkMode),
                          ),
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

  Widget _buildSettingsButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 24),
      label: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(AppConstants.buttonWidth, AppConstants.buttonHeight),
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        foregroundColor: Colors.black,
        elevation: 4,
      ),
    );
  }
}