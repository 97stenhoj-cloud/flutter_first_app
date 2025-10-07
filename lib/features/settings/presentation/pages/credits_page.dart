import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CreditsPage extends StatelessWidget {
  final bool isDarkMode;
  
  const CreditsPage({super.key, required this.isDarkMode});

  List<Color> get gradientColors {
    if (isDarkMode) {
      return [const Color(0xFF2c3e50), const Color(0xFF34495e)];
    } else {
      return [const Color(0xFF667eea), const Color(0xFF764ba2)];
    }
  }

  Color get textColor => isDarkMode ? Colors.white : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: textColor),
                ),
              ),
              
              // Main content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Heart decoration
                      const Text(
                        '💕',
                        style: TextStyle(fontSize: 60),
                      ),
                      const SizedBox(height: 30),
                      
                      // Main message
                      Text(
                        'Made for my beautiful wife',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      
                      Text(
                        'Otilia Stenhøj',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 0),
                              blurRadius: 15,
                              color: textColor.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      
                      // Additional decoration
                      const Text(
                        '🎙️ ❤️ 🎙️',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      
                      Text(
                        'With love and conversations',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}