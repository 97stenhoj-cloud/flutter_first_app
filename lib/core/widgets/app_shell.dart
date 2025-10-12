import 'package:flutter/material.dart';
import '../utils/theme_helper.dart';
import '../utils/theme_notifier.dart';

/// AppShell provides a static background with dynamic content
/// This keeps the gradient background fixed while pages transition
class AppShell extends StatelessWidget {
  final Widget child;
  
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeProvider.of(context);
    final isDarkMode = themeNotifier.isDarkMode;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode),
        child: child,
      ),
    );
  }
}