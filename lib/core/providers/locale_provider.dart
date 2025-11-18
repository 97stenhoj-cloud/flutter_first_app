import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// List of supported languages with flags
const List<Map<String, String>> supportedLanguages = [
  {'code': 'en', 'name': 'English', 'flag': '🇬🇧'},
  {'code': 'da', 'name': 'Dansk', 'flag': '🇩🇰'},
  {'code': 'de', 'name': 'Deutsch', 'flag': '🇩🇪'},
  {'code': 'es', 'name': 'Español', 'flag': '🇪🇸'},
  {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷'},
  {'code': 'it', 'name': 'Italiano', 'flag': '🇮🇹'},
  {'code': 'nb', 'name': 'Norsk', 'flag': '🇳🇴'},
  {'code': 'nl', 'name': 'Nederlands', 'flag': '🇳🇱'},
  {'code': 'pl', 'name': 'Polski', 'flag': '🇵🇱'},
  {'code': 'pt', 'name': 'Português', 'flag': '🇵🇹'},
  {'code': 'ro', 'name': 'Română', 'flag': '🇷🇴'},
  {'code': 'sv', 'name': 'Svenska', 'flag': '🇸🇪'},
];

// Locale state class
class LocaleState {
  final Locale currentLocale;
  final bool hasManuallySelectedLanguage;

  LocaleState({
    required this.currentLocale,
    required this.hasManuallySelectedLanguage,
  });

  LocaleState copyWith({
    Locale? currentLocale,
    bool? hasManuallySelectedLanguage,
  }) {
    return LocaleState(
      currentLocale: currentLocale ?? this.currentLocale,
      hasManuallySelectedLanguage:
          hasManuallySelectedLanguage ?? this.hasManuallySelectedLanguage,
    );
  }
}

// Locale state notifier
class LocaleNotifier extends StateNotifier<LocaleState> {
  LocaleNotifier()
      : super(LocaleState(
          currentLocale: const Locale('en'),
          hasManuallySelectedLanguage: false,
        )) {
    _initialize();
  }

  Future<void> _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code');

    if (languageCode != null) {
      state = state.copyWith(
        currentLocale: Locale(languageCode),
        hasManuallySelectedLanguage: true,
      );
    }
  }

  Future<void> setLocale(Locale locale) async {
    state = state.copyWith(
      currentLocale: locale,
      hasManuallySelectedLanguage: true,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
  }

  Future<void> clearManualSelection() async {
    state = state.copyWith(
      hasManuallySelectedLanguage: false,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('language_code');
  }

  Locale get currentLocale => state.currentLocale;
  bool get hasManuallySelectedLanguage => state.hasManuallySelectedLanguage;
}

// The provider
final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleState>((ref) {
  return LocaleNotifier();
});
