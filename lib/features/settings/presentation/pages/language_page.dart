// lib/features/settings/presentation/pages/language_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/constants/app_constants.dart';

class LanguagePage extends ConsumerWidget {
  final bool isDarkMode;

  const LanguagePage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final localeState = ref.watch(localeProvider);

    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode),
        child: SafeArea(
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
                        color: ThemeHelper.getHeadingTextColor(isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      l10n.language,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getHeadingTextColor(isDarkMode),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Language list
                Expanded(
                  child: ListView.builder(
                    itemCount: supportedLanguages.length,
                    itemBuilder: (context, index) {
                      final language = supportedLanguages[index];
                      final isSelected = localeState.currentLocale.languageCode == language['code'];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _buildLanguageButton(
                          context: context,
                          ref: ref,
                          flag: language['flag']!,
                          name: language['name']!,
                          code: language['code']!,
                          isSelected: isSelected,
                          isDarkMode: isDarkMode,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton({
    required BuildContext context,
    required WidgetRef ref,
    required String flag,
    required String name,
    required String code,
    required bool isSelected,
    required bool isDarkMode,
  }) {
    final colors = isSelected
        ? ThemeHelper.getPrimaryButtonGradient(isDarkMode).colors
        : ThemeHelper.getSecondaryButtonGradient(isDarkMode).colors;

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
              ref.read(localeProvider.notifier).setLocale(Locale(code));
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
                children: [
                  Text(
                    flag,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: isSelected ? 18 : 16,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : ThemeHelper.getSecondaryButtonTextColor(isDarkMode),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
