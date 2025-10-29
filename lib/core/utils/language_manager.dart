// lib/core/utils/language_manager.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageManager extends ChangeNotifier {
  static final LanguageManager _instance = LanguageManager._internal();
  factory LanguageManager() => _instance;
  LanguageManager._internal();

  Locale _currentLocale = const Locale('en');
  bool _hasManuallySelectedLanguage = false;

  Locale get currentLocale => _currentLocale;
  bool get hasManuallySelectedLanguage => _hasManuallySelectedLanguage;

  // List of supported languages with flags
  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'name': 'English', 'flag': '🇬🇧'},
    {'code': 'da', 'name': 'Dansk', 'flag': '🇩🇰'},
    {'code': 'de', 'name': 'Deutsch', 'flag': '🇩🇪'},
    {'code': 'es', 'name': 'Español', 'flag': '🇪🇸'},
    {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷'},
    {'code': 'pt', 'name': 'Português', 'flag': '🇵🇹'},
    {'code': 'ro', 'name': 'Română', 'flag': '🇷🇴'},
  ];

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code');
    
    if (languageCode != null) {
      _currentLocale = Locale(languageCode);
      _hasManuallySelectedLanguage = true;
      notifyListeners();
    }
    // If no saved language, let the system use device locale
  }

  Future<void> setLocale(Locale locale) async {
    _currentLocale = locale;
    _hasManuallySelectedLanguage = true;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    
    notifyListeners();
  }

  Future<void> clearManualSelection() async {
    _hasManuallySelectedLanguage = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('language_code');
    notifyListeners();
  }

  String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'da':
        return 'Dansk';
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'pt':
        return 'Português';
      case 'ro':
        return 'Română';
      default:
        return code;
    }
  }
}