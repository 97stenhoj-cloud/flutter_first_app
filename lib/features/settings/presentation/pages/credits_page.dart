// lib/features/settings/presentation/pages/credits_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/theme_helper.dart';

class CreditsPage extends StatelessWidget {
  final bool isDarkMode;
  
  const CreditsPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode), // Use main background
        child: SafeArea(
          child: Column(
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back, 
                      color: ThemeHelper.getHeadingTextColor(isDarkMode),
                      size: 28,
                    ),
                  ),
                ),
              ),
              
              // Main content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Heart decoration
                      const Text(
                        '💕',
                        style: TextStyle(fontSize: 60),
                      ),
                      const SizedBox(height: 30),
                      
                      // Main message
                      Text(
                        l10n.madeForWife,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: ThemeHelper.getHeadingTextColor(isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      
                      Text(
                        l10n.otiLia,
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getHeadingTextColor(isDarkMode),
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 0),
                              blurRadius: 15,
                              color: ThemeHelper.getHeadingTextColor(isDarkMode).withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      
                      // Additional decoration
                      const Text(
                        '🎙️ ❤️ 🎙️',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      
                      Text(
                        l10n.withLoveAndConversations,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: ThemeHelper.getBodyTextColor(isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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