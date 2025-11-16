import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
