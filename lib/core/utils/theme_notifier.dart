import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class ThemeProvider extends InheritedWidget {
  final ThemeNotifier themeNotifier;

  const ThemeProvider({
    super.key,
    required this.themeNotifier,
    required super.child,
  });

  static ThemeNotifier of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(provider != null, 'No ThemeProvider found in context');
    return provider!.themeNotifier;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return themeNotifier != oldWidget.themeNotifier;
  }
}