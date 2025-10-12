// lib/core/utils/theme_helper.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';

class ThemeHelper {
  // ============================================================================
  // SPACING CONSTANTS
  // ============================================================================
  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space20 = 20.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;
  static const double space40 = 40.0;
  static const double space48 = 48.0;
  
  // ============================================================================
  // BORDER RADIUS
  // ============================================================================
  static const double buttonRadius = 20.0;
  static const double cardRadius = 16.0;
  static const double inputRadius = 12.0;
  
  // ============================================================================
  // MAIN BACKGROUND GRADIENT - YOUR SPECIFIC COLORS
  // ============================================================================
  static List<Color> getMainMenuGradient(bool isDarkMode) {
    if (isDarkMode) {
      // Dark mode: deeper versions of your gradient
      return [
        const Color(0xFF8A6A64), // darker version of #e8d6d0
        const Color(0xFF6B5A72), // darker version of #cfc3d8
        const Color(0xFF8B7A4F), // darker version of #f0d6a6
      ];
    } else {
      // Light mode: your exact colors
      return [
        const Color(0xFFE8D6D0), // #e8d6d0
        const Color(0xFFB995D3), // #b995d3
        const Color(0xFFF0D6A6), // #f0d6a6
      ];
    }
  }
  
  static LinearGradient getBackgroundGradient(bool isDarkMode) {
    return LinearGradient(
      begin: Alignment(-1, -1), // 135 degrees
      end: Alignment(1, 1),     // 135 degrees
      colors: getMainMenuGradient(isDarkMode),
    );
  }
  
  static BoxDecoration getBackgroundDecoration(bool isDarkMode) {
    return BoxDecoration(
      gradient: getBackgroundGradient(isDarkMode),
    );
  }

  // ============================================================================
  // PRIMARY BUTTON GRADIENT - ROSE TO PEACHY CORAL
  // ============================================================================
  static LinearGradient getPrimaryButtonGradient(bool isDarkMode) {
    if (isDarkMode) {
      // Dark mode: slightly deeper but still vibrant
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFE57A8C), // deeper rose
          Color(0xFFE39867), // deeper peachy coral
        ],
      );
    } else {
      // Light mode: rose to peachy coral
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF28B9C), // soft rose (top)
          Color(0xFFF5A877), // peachy coral (bottom)
        ],
      );
    }
  }
  
  // ============================================================================
  // SECONDARY BUTTON GRADIENT - BEIGE TO CLAY
  // ============================================================================
  static LinearGradient getSecondaryButtonGradient(bool isDarkMode) {
    if (isDarkMode) {
      // Dark mode: darker clay tones
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4A413A), // dark clay
          Color(0xFF3D342D), // darker clay
        ],
      );
    } else {
      // Light mode: beige to clay
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFE6DDD4), // light beige top
          Color(0xFFD0C0B2), // warm clay bottom
        ],
      );
    }
  }
  
  // ============================================================================
  // TEXT COLORS
  // ============================================================================
  static Color getHeadingTextColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFFF3E3CC) // warm beige for dark mode
        : const Color(0xFF4A3A33); // warm brown for light mode
  }
  
  static Color getBodyTextColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFFE6DDD4) // light beige for dark mode
        : const Color(0xFF5A4A42); // general text
  }
  
  static Color getMutedTextColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFFB5A598) // muted beige for dark mode
        : const Color(0xFFA39083); // smaller info
  }
  
  // Primary button always uses white text
  static Color getPrimaryButtonTextColor(bool isDarkMode) {
    return Colors.white;
  }
  
  // Secondary button text color
  static Color getSecondaryButtonTextColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFFE6DDD4) // light beige for dark mode
        : const Color(0xFF4B3A30); // warm brown for light mode
  }
  
  // ============================================================================
  // REUSABLE LAYERED BUTTON WIDGET
  // ============================================================================
  static Widget buildLayeredButton({
    required String text,
    required VoidCallback onPressed,
    required bool isPrimary,
    required bool isDarkMode,
    double? width,
    double? height,
    IconData? icon,
  }) {
    final colors = isPrimary 
        ? getPrimaryButtonGradient(isDarkMode).colors
        : getSecondaryButtonGradient(isDarkMode).colors;
    
    final buttonWidth = width ?? AppConstants.buttonWidth;
    final buttonHeight = height ?? AppConstants.buttonHeight;
    
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outermost layer
        Container(
          width: buttonWidth,
          height: buttonHeight,
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
          width: buttonWidth - 8,
          height: buttonHeight - 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors[0].withValues(alpha: 0.85), colors[1].withValues(alpha: 0.85)],
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
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: buttonWidth - 16,
              height: buttonHeight - 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: icon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          size: 24,
                          color: isPrimary 
                              ? Colors.white
                              : getSecondaryButtonTextColor(isDarkMode),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          text,
                          style: GoogleFonts.poppins(
                            fontSize: isPrimary ? 18 : 16,
                            fontWeight: isPrimary ? FontWeight.bold : FontWeight.w600,
                            color: isPrimary 
                                ? Colors.white
                                : getSecondaryButtonTextColor(isDarkMode),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      text,
                      style: GoogleFonts.poppins(
                        fontSize: isPrimary ? 18 : 16,
                        fontWeight: isPrimary ? FontWeight.bold : FontWeight.w600,
                        color: isPrimary 
                            ? Colors.white
                            : getSecondaryButtonTextColor(isDarkMode),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
  
  // ============================================================================
  // LEGACY METHODS (keeping these for compatibility with your existing code)
  // ============================================================================
  static List<Color> getSecondaryGradient(bool isDarkMode) {
    return getSecondaryButtonGradient(isDarkMode).colors;
  }
  
  static Color getTextColor(bool isDarkMode) {
    return getPrimaryButtonTextColor(isDarkMode);
  }
  
  static Color getButtonTextColor(bool isDarkMode) {
    return getPrimaryButtonTextColor(isDarkMode);
  }
  
  static Color getButtonBackgroundColor(bool isDarkMode) {
    return getPrimaryButtonGradient(isDarkMode).colors.first.withValues(alpha: 0.95);
  }
  
  static Color getCardColor(bool isDarkMode) {
    return isDarkMode
        ? const Color(0xFF4B3A30) // warm brown for light mode
        : const Color(0xFFE6DDD4); // light beige for dark mode
}
  
  // ============================================================================
  // GAME MODE COLORS - Using variations of the new theme
  // ============================================================================
  static Color getGameBackgroundColor(String gameMode, bool isDarkMode) {
    String normalizedMode = gameMode.toLowerCase();
    
    switch (normalizedMode) {
      case 'family':
        return isDarkMode 
          ? const Color(0xFF7B5D47) // rich mocha brown
          : const Color(0xFFD7B299); // creamy cappuccino
      case 'couple':
        return isDarkMode 
            ? const Color(0xFF8A6A64) // dark version of pink
            : const Color(0xFFE8D6D0); // pink from gradient
      case 'friends':
        return isDarkMode 
            ? const Color(0xFF6B5A72) // dark version of lavender
            : const Color(0xFFCFC3D8); // lavender from gradient
      default:
        return isDarkMode 
            ? const Color(0xFF3A3230) 
            : const Color(0xFFF8F4F0);
    }
  }

  static List<Color> getGameModeGradient(String gameMode, bool isDarkMode) {
    String normalizedMode = gameMode.toLowerCase();
    
    switch (normalizedMode) {
      case 'couple':
        // Rose theme for couple
        return isDarkMode
            ? [const Color(0xFFE57A8C), const Color(0xFFE39867)]
            : [const Color(0xFFF28B9C), const Color(0xFFF5A877)];
      case 'friends':
        // Lavender theme for friends
        return isDarkMode
            ? [const Color(0xFF9276AB), const Color(0xFF7A6A9C)]
            : [const Color(0xFFB995D3), const Color(0xFFA384C2)];
      case 'family':
        // Gold theme for family
        return isDarkMode
            ? [const Color(0xFFD4A066), const Color(0xFFBF8F4F)]
            : [const Color(0xFFF0D6A6), const Color(0xFFE3C590)];
      default:
        return getMainMenuGradient(isDarkMode);
    }
  }
  
  // ============================================================================
  // BUTTON SHADOW
  // ============================================================================
  static List<BoxShadow> getButtonShadow(bool isDarkMode) {
    return [
      BoxShadow(
        color: isDarkMode 
            ? const Color.fromRGBO(0, 0, 0, 0.3)
            : const Color.fromRGBO(100, 80, 60, 0.15),
        blurRadius: isDarkMode ? 12 : 8,
        offset: const Offset(0, 4),
      ),
    ];
  }
  
  static BoxDecoration getPrimaryButtonDecoration(bool isDarkMode) {
    return BoxDecoration(
      gradient: getPrimaryButtonGradient(isDarkMode),
      borderRadius: BorderRadius.circular(buttonRadius),
      boxShadow: [
        BoxShadow(
          color: isDarkMode 
              ? const Color.fromRGBO(0, 0, 0, 0.4)
              : const Color.fromRGBO(100, 80, 60, 0.15),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
  
  static BoxDecoration getSecondaryButtonDecoration(bool isDarkMode) {
    return BoxDecoration(
      gradient: getSecondaryButtonGradient(isDarkMode),
      borderRadius: BorderRadius.circular(buttonRadius),
      boxShadow: isDarkMode ? [] : [], // No shadow for secondary buttons
    );
  }
  
  // ============================================================================
  // SEMANTIC COLORS
  // ============================================================================
  static Color getSuccessColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFF8BC48A) // lighter green for dark mode
        : const Color(0xFF6BAA6A); // soft green
  }
  
  static Color getWarningColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFFF5B055) // lighter amber for dark mode
        : const Color(0xFFE09A47); // warm amber
  }
  
  static Color getErrorColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFFEF8A7C) // lighter red for dark mode
        : const Color(0xFFD46B5D); // muted red
  }
  
  static Color getInfoColor(bool isDarkMode) {
    return isDarkMode 
        ? const Color(0xFF9AB8D5) // lighter blue for dark mode
        : const Color(0xFF7A9BB8); // dusty blue
  }
}