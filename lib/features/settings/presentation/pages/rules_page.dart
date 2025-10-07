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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back, 
                      color: ThemeHelper.getTextColor(isDarkMode),
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  Center(
                    child: Text(
                      'How to Play',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
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
                    ),
                  ),
                  const SizedBox(height: 32),
                  
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
                  
                  const SizedBox(height: 32),
                  
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
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