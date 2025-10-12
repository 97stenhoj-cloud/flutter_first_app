// lib/features/settings/presentation/pages/rules_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class RulesPage extends StatelessWidget {
  final bool isDarkMode;
  
  const RulesPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode), // Use main background
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back, 
                      color: ThemeHelper.getHeadingTextColor(isDarkMode),
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  Center(
                    child: Text(
                      l10n.howToPlay,
                      style: GoogleFonts.poppins(
                        fontSize: 32,
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
                  ),
                  const SizedBox(height: 40),
                  
                  _buildSection(
                    title: l10n.chooseYourMode,
                    content: l10n.chooseYourModeDesc,
                  ),
                  
                  _buildSection(
                    title: l10n.pickCategory,
                    content: l10n.pickCategoryDesc,
                  ),
                  
                  _buildSection(
                    title: l10n.startTalking,
                    content: l10n.startTalkingDesc,
                  ),
                  
                  _buildSection(
                    title: l10n.navigateQuestions,
                    content: l10n.navigateQuestionsDesc,
                  ),
                  
                  _buildSection(
                    title: l10n.premiumFeatures,
                    content: l10n.premiumFeaturesDesc,
                  ),
                  
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.proTips,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.getTextColor(isDarkMode),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.proTipsDesc,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            height: 1.6,
                            color: ThemeHelper.getTextColor(isDarkMode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeHelper.getTextColor(isDarkMode),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 16,
              height: 1.6,
              color: ThemeHelper.getTextColor(isDarkMode).withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}