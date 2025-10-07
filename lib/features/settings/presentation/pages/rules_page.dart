import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';

class RulesPage extends StatelessWidget {
  final bool isDarkMode;
  
  const RulesPage({super.key, required this.isDarkMode});

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
                    title: '1. Choose Your Mode',
                    content: 'Select from three conversation styles:\n\n'
                        '• Family - Warm, wholesome conversations perfect for all ages\n'
                        '• Couple - Intimate and romantic questions to deepen your connection\n'
                        '• Friends - Fun and entertaining topics for your squad',
                  ),
                  
                  _buildSection(
                    title: '2. Pick a Category',
                    content: 'Each mode has multiple categories with unique question packs. '
                        'Free categories are unlocked, while premium categories require a subscription.',
                  ),
                  
                  _buildSection(
                    title: '3. Start Talking',
                    content: 'Questions appear full screen. Take turns reading and answering them honestly. '
                        'There are no wrong answers - the goal is meaningful conversation!',
                  ),
                  
                  _buildSection(
                    title: '4. Navigate Questions',
                    content: '• Swipe right or tap "Next" for the next question\n'
                        '• Swipe left or tap "Previous" to revisit questions\n'
                        '• Tap the home button to return to the main menu anytime',
                  ),
                  
                  _buildSection(
                    title: '5. Premium Features',
                    content: 'Unlock exclusive question categories with a subscription:\n\n'
                        '• 1 Bundle (4 categories) - 59 DKK/month\n'
                        '• 2 Bundles (8 categories) - 109 DKK/month\n'
                        '• 3 Bundles (12 categories) - 149 DKK/month',
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
                          'Pro Tips',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.getTextColor(isDarkMode),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '• Create a comfortable, distraction-free environment\n'
                          '• Listen actively and be present\n'
                          '• Share honestly and encourage others to do the same\n'
                          '• Respect boundaries - skip questions if needed\n'
                          '• Have fun and enjoy connecting!',
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