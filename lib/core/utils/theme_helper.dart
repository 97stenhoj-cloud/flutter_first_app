// lib/core/utils/theme_helper.dart
import 'package:flutter/material.dart';

class ThemeHelper {
  static List<Color> getMainMenuGradient(bool isDarkMode) {
    if (isDarkMode) {
      return [
        const Color.fromARGB(255, 26, 26, 46),
        const Color.fromRGBO(22, 33, 62, 1),
        const Color.fromRGBO(15, 52, 96, 1),
      ];
    } else {
      return [
        const Color.fromRGBO(80, 150, 220, 1),  // Deeper blue
        const Color.fromRGBO(5, 100, 180, 1),    // Richer blue
        const Color.fromRGBO(85, 70, 200, 1),    // Deeper purple
      ];
    }
  }

  static List<Color> getSecondaryGradient(bool isDarkMode) {
    if (isDarkMode) {
      return [const Color(0xFF2c3e50), const Color(0xFF34495e)];
    } else {
      return [const Color(0xFF5568D3), const Color(0xFF6B4BA2)]; // Deeper purples
    }
  }

  static Color getGameBackgroundColor(String gameMode, bool isDarkMode) {
    String normalizedMode = gameMode.toLowerCase();
    
    switch (normalizedMode) {
      case 'family':
        return isDarkMode 
            ? const Color.fromRGBO(109, 76, 65, 1) 
            : const Color.fromRGBO(160, 130, 110, 1); // Much richer brown
      case 'couple':
        return isDarkMode 
            ? const Color.fromRGBO(194, 24, 91, 1) 
            : const Color.fromRGBO(220, 80, 140, 1); // Vibrant pink
      case 'friends':
        return isDarkMode 
            ? const Color.fromRGBO(255, 143, 0, 1) 
            : const Color.fromRGBO(230, 130, 40, 1); // Rich orange
      default:
        return isDarkMode ? Colors.grey[800]! : Colors.grey[600]!;
    }
  }

  static List<Color> getGameModeGradient(String gameMode, bool isDarkMode) {
    String normalizedMode = gameMode.toLowerCase();
    
    switch (normalizedMode) {
      case 'couple':
        return isDarkMode
            ? [const Color(0xFFAD1457), const Color(0xFF880E4F)]
            : [const Color(0xFFD81B60), const Color(0xFFC2185B)]; // Vibrant pink instead of pale
      case 'friends':
        return isDarkMode
            ? [const Color(0xFFFF8F00), const Color(0xFFFF6F00)]
            : [const Color(0xFFFF9800), const Color(0xFFF57C00)]; // Rich orange instead of pale
      case 'family':
        return isDarkMode
            ? [const Color(0xFF8D6E63), const Color(0xFF6D4C41)]
            : [const Color(0xFF8D6E63), const Color(0xFF795548)]; // Richer brown instead of pale
      default:
        return isDarkMode
            ? [const Color(0xFF424242), const Color(0xFF212121)]
            : [const Color(0xFF757575), const Color(0xFF616161)];
    }
  }

  static Color getTextColor(bool isDarkMode) => Colors.white;
  
  static Color getButtonBackgroundColor(bool isDarkMode) {
    return isDarkMode 
        ? Colors.white.withValues(alpha: 0.9) 
        : Colors.white.withValues(alpha: 0.95);
  }
  
  static Color getButtonTextColor(bool isDarkMode) => Colors.black;
}