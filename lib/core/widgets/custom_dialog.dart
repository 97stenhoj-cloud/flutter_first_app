import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme_helper.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? content;
  final Widget? contentWidget;
  final List<Widget> actions;
  final bool isDarkMode;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  const CustomDialog({
    super.key,
    this.title,
    this.titleWidget,
    this.content,
    this.contentWidget,
    required this.actions,
    required this.isDarkMode,
    this.icon,
    this.iconColor,
    this.iconSize,
  }) : assert(title != null || titleWidget != null, 'Either title or titleWidget must be provided'),
       assert(content != null || contentWidget != null, 'Either content or contentWidget must be provided');

  @override
Widget build(BuildContext context) {
  return Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    child: Container(
      constraints: const BoxConstraints(maxWidth: 340, maxHeight: 600), // Add maxHeight
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [
                  const Color(0xFF2D1B2E),
                  const Color(0xFF1A0E1F),
                ]
              : [
                  Colors.white,
                  const Color(0xFFFFFBF7),
                ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.5 : 0.15),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title section with optional icon
          Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              children: [
                if (icon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          (iconColor ?? const Color(0xFFFF6B9D)).withValues(alpha: 0.2),
                          (iconColor ?? const Color(0xFFFF6B9D)).withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: iconSize ?? 48,
                      color: iconColor ?? const Color(0xFFFF6B9D),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                titleWidget ??
                    Text(
                      title!,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : const Color(0xFF2D1B2E),
                      ),
                      textAlign: TextAlign.center,
                    ),
              ],
            ),
          ),
          
          // Content section - WRAPPED IN FLEXIBLE
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: contentWidget ??
                    Text(
                      content!,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        height: 1.5,
                        color: isDarkMode
                            ? Colors.white.withValues(alpha: 0.85)
                            : const Color(0xFF2D1B2E).withValues(alpha: 0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          ),
          
          // Actions section
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: actions,
            ),
          ),
        ],
      ),
    ),
  );
}
}

// Custom button widget for dialogs
class DialogButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isDarkMode;
  final Color? customColor;
  final IconData? icon;

  const DialogButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
    required this.isDarkMode,
    this.customColor,
    this.icon,
  });

 @override
Widget build(BuildContext context) {
  if (isPrimary) {
    return Container(
      decoration: BoxDecoration(
        gradient: customColor != null
            ? LinearGradient(
                colors: [customColor!, customColor!.withValues(alpha: 0.8)],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFFF6B9D),
                  const Color(0xFFFF8FA3),
                ],
              ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (customColor ?? const Color(0xFFFF6B9D))
                .withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    // Secondary button
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.black.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: isDarkMode
              ? Colors.white.withValues(alpha: 0.7)
              : const Color(0xFF2D1B2E).withValues(alpha: 0.7),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
}