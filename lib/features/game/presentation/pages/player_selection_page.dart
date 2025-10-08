import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import 'game_mode_selection_page.dart';

class PlayerSelectionPage extends StatefulWidget {
  final bool isDarkMode;
  
  const PlayerSelectionPage({super.key, required this.isDarkMode});

  @override
  State<PlayerSelectionPage> createState() => _PlayerSelectionPageState();
}

class _PlayerSelectionPageState extends State<PlayerSelectionPage> {
  int selectedPlayers = 2;

  List<Color> get gradientColors {
    if (widget.isDarkMode) {
      return [const Color(0xFF2c3e50), const Color(0xFF34495e)];
    } else {
      return [const Color(0xFF667eea), const Color(0xFF764ba2)];
    }
  }

  Color get textColor => widget.isDarkMode ? Colors.white : Colors.white;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                // Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: textColor, size: 28),
                  ),
                ),
                
                // Main content centered
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.howManyPlayers,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 0),
                              blurRadius: 10,
                              color: textColor.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          '$selectedPlayers ${l10n.players}',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                color: textColor.withValues(alpha: 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      SizedBox(
                        height: 150,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          onSelectedItemChanged: (int value) {
                            setState(() {
                              selectedPlayers = value + 2;
                            });
                          },
                          children: List.generate(9, (index) {
                            return Center(
                              child: Text(
                                '${index + 2}',
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: textColor,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameModeSelectionPage(
                                isDarkMode: widget.isDarkMode,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 60),
                          backgroundColor: Colors.white.withValues(alpha: 0.9),
                          foregroundColor: Colors.black,
                        ),
                        child: Text(
                          l10n.continueButton,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}