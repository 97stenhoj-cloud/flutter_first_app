// lib/features/settings/presentation/pages/language_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/language_manager.dart';
import '../../../../core/constants/app_constants.dart';

class LanguagePage extends StatefulWidget {
  final bool isDarkMode;
  
  const LanguagePage({super.key, required this.isDarkMode});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final languageManager = LanguageManager();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    l10n.language,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // Language list
              Expanded(
                child: ListView.builder(
                  itemCount: LanguageManager.supportedLanguages.length,
                  itemBuilder: (context, index) {
                    final language = LanguageManager.supportedLanguages[index];
                    final isSelected = languageManager.currentLocale.languageCode == language['code'];
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _buildLanguageButton(
                        flag: language['flag']!,
                        name: language['name']!,
                        code: language['code']!,
                        isSelected: isSelected,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton({
    required String flag,
    required String name,
    required String code,
    required bool isSelected,
  }) {
    final colors = isSelected 
        ? ThemeHelper.getPrimaryButtonGradient(widget.isDarkMode).colors
        : ThemeHelper.getSecondaryButtonGradient(widget.isDarkMode).colors;
    
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
            boxShadow: ThemeHelper.getButtonShadow(widget.isDarkMode),
          ),
        ),
        // Middle layer
        Container(
          width: AppConstants.buttonWidth - 8,
          height: AppConstants.buttonHeight - 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors[0].withValues(alpha: 0.85),
                colors[1].withValues(alpha: 0.85)
              ],
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
            onTap: () {
              languageManager.setLocale(Locale(code));
              setState(() {});
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: AppConstants.buttonWidth - 16,
              height: AppConstants.buttonHeight - 16,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    flag,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: isSelected ? 18 : 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                      color: isSelected 
                          ? Colors.white
                          : ThemeHelper.getSecondaryButtonTextColor(widget.isDarkMode),
                    ),
                  ),
                  if (isSelected) ...[
                    const Spacer(),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}