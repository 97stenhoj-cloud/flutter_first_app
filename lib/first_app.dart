import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:math';
import 'dart:convert';

void main() {
  runApp(const TalkingGameApp());
}

class TalkingGameApp extends StatefulWidget {
  const TalkingGameApp({super.key});

  @override
  State<TalkingGameApp> createState() => _TalkingGameAppState();
}

class _TalkingGameAppState extends State<TalkingGameApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talking Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
        ),
      ),
      home: MainMenuPage(
        isDarkMode: isDarkMode, 
        onThemeToggle: toggleTheme,
      ),
    );
  }
}

class MainMenuPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;
  
  const MainMenuPage({
    super.key, 
    required this.isDarkMode, 
    required this.onThemeToggle,
  });

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.asset('assets/images/parrots.mp4');
      await _videoController!.initialize();
      _videoController!.setLooping(true);
      _videoController!.setVolume(0.0);
      _videoController!.play();
      setState(() {});
    } catch (e) {
      debugPrint('Error loading video: $e');
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  // Get theme-appropriate colors
  List<Color> get gradientColors {
    if (widget.isDarkMode) {
      return [
        const Color(0xFF1a1a2e),
        const Color(0xFF16213e),
        const Color(0xFF0f3460),
      ];
    } else {
      return [
        const Color(0xFF74b9ff),
        const Color(0xFF0984e3),
        const Color(0xFF6c5ce7),
      ];
    }
  }

  Color get textColor => widget.isDarkMode ? Colors.white : Colors.white;
  Color get buttonBackgroundColor => widget.isDarkMode 
      ? Colors.white.withValues(alpha: 0.9) 
      : Colors.white.withValues(alpha: 0.95);
  Color get buttonTextColor => widget.isDarkMode ? Colors.black : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // App bar with theme toggle
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 48), // Spacer for centering
                        Text(
                          'Talking Game',
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Theme toggle button
                        IconButton(
                          onPressed: widget.onThemeToggle,
                          icon: Icon(
                            widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            color: textColor,
                            size: 28,
                          ),
                          tooltip: widget.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                        ),
                      ],
                    ),
                  ),
                  
                  // Main content
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // App Title
                        Text(
                          '🎙️ Talking Game',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 0),
                                blurRadius: 20,
                                color: textColor.withValues(alpha: 0.5),
                              ),
                              const Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        
                        // Start Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PlayerSelectionPage(isDarkMode: widget.isDarkMode)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 60),
                            backgroundColor: buttonBackgroundColor,
                            foregroundColor: buttonTextColor,
                          ),
                          child: Text(
                            'Start',
                            style: GoogleFonts.poppins(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Rules Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RulesPage(isDarkMode: widget.isDarkMode)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 60),
                            backgroundColor: buttonBackgroundColor,
                            foregroundColor: buttonTextColor,
                          ),
                          child: Text(
                            'Rules',
                            style: GoogleFonts.poppins(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Credits Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreditsPage(isDarkMode: widget.isDarkMode)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 60),
                            backgroundColor: buttonBackgroundColor,
                            foregroundColor: buttonTextColor,
                          ),
                          child: Text(
                            'Credits',
                            style: GoogleFonts.poppins(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        
                        // Small video in the middle-bottom
                        if (_videoController != null && _videoController!.value.isInitialized)
                          Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: VideoPlayer(_videoController!),
                            ),
                          )
                        else
                          // Placeholder while video loads or if it fails
                          Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                              color: widget.isDarkMode 
                                  ? Colors.white.withValues(alpha: 0.2)
                                  : Colors.white.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: widget.isDarkMode 
                                    ? Colors.white.withValues(alpha: 0.5)
                                    : Colors.white.withValues(alpha: 0.7),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.video_library,
                                    color: textColor,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Loading Video...',
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                        'How many players?',
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
                          '$selectedPlayers Players',
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
                                playerCount: selectedPlayers,
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
                          'Continue',
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

class GameModeSelectionPage extends StatelessWidget {
  final int playerCount;
  final bool isDarkMode;
  
  const GameModeSelectionPage({
    super.key, 
    required this.playerCount,
    required this.isDarkMode,
  });

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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
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
                        'Choose your game mode',
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
                      const SizedBox(height: 50),
                      
                      // Cosy Mode
                      ElevatedButton.icon(
                        onPressed: () => _selectMode(context, 'cosy'),
                        icon: const Text('☕', style: TextStyle(fontSize: 24)),
                        label: Text('Cosy', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 80),
                          backgroundColor: isDarkMode 
                              ? const Color(0xFF8D6E63) // Softer brown for dark mode
                              : const Color(0xFFBCAAA4), // Lighter brown for light mode
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: isDarkMode 
                              ? Colors.black.withValues(alpha: 0.3)
                              : Colors.brown.withValues(alpha: 0.3),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Sexy Mode
                      ElevatedButton.icon(
                        onPressed: () => _selectMode(context, 'sexy'),
                        icon: const Text('💋', style: TextStyle(fontSize: 24)),
                        label: Text('Sexy', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 80),
                          backgroundColor: isDarkMode 
                              ? const Color(0xFFAD1457) // Softer pink for dark mode
                              : const Color(0xFFF8BBD9), // Lighter pink for light mode
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: isDarkMode 
                              ? Colors.black.withValues(alpha: 0.3)
                              : Colors.pink.withValues(alpha: 0.3),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Fun Mode
                      ElevatedButton.icon(
                        onPressed: () => _selectMode(context, 'fun'),
                        icon: const Text('🎉', style: TextStyle(fontSize: 24)),
                        label: Text('Fun', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 80),
                          backgroundColor: isDarkMode 
                              ? const Color(0xFFFF8F00) // Softer orange for dark mode
                              : const Color(0xFFFFE0B2), // Lighter orange for light mode
                          foregroundColor: isDarkMode ? Colors.white : Colors.black87,
                          elevation: 8,
                          shadowColor: isDarkMode 
                              ? Colors.black.withValues(alpha: 0.3)
                              : Colors.orange.withValues(alpha: 0.3),
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

  void _selectMode(BuildContext context, String mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(
          playerCount: playerCount,
          gameMode: mode,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  final int playerCount;
  final String gameMode;
  final bool isDarkMode;
  
  const GamePage({
    super.key,
    required this.playerCount,
    required this.gameMode,
    required this.isDarkMode,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Map<String, List<String>> questions = {};
  List<String> availableQuestions = [];
  List<String> usedQuestions = [];
  String currentQuestion = '';
  Timer? timer;
  int remainingSeconds = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data/questions.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      
      setState(() {
        questions = jsonMap.map((key, value) => 
          MapEntry(key, List<String>.from(value))
        );
        availableQuestions = List.from(questions[widget.gameMode] ?? []);
        isLoading = false;
      });
      
      if (availableQuestions.isNotEmpty) {
        _showNextQuestion();
      }
    } catch (e) {
      debugPrint('Error loading questions: $e');
      setState(() {
        questions = {
          'cosy': ['What is your favorite childhood memory?', 'If you could have dinner with anyone, who would it be?', 'What makes you feel most comfortable and relaxed?'],
          'sexy': ['What is your biggest turn-on?', 'Describe your ideal romantic evening.', 'What is something you find irresistibly attractive?'],
          'fun': ['If you could have any superpower, what would it be?', 'What is the weirdest thing you have ever eaten?', 'If you were a cartoon character, who would you be?'],
        };
        availableQuestions = List.from(questions[widget.gameMode] ?? []);
        isLoading = false;
      });
      _showNextQuestion();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _showNextQuestion() {
    if (availableQuestions.isEmpty) {
      _showGameEndDialog();
      return;
    }

    final random = Random();
    final questionIndex = random.nextInt(availableQuestions.length);
    
    setState(() {
      if (currentQuestion.isNotEmpty) {
        usedQuestions.add(currentQuestion);
      }
      
      currentQuestion = availableQuestions[questionIndex];
      availableQuestions.removeAt(questionIndex);
    });
  }

  void _showPreviousQuestion() {
    if (usedQuestions.isEmpty) {
      return;
    }

    setState(() {
      if (currentQuestion.isNotEmpty) {
        availableQuestions.add(currentQuestion);
      }
      
      currentQuestion = usedQuestions.removeLast();
    });
  }

  void _onSwipe(DragEndDetails details) {
    const double sensitivity = 100.0;
    
    if (details.primaryVelocity! > sensitivity) {
      _showNextQuestion();
    } else if (details.primaryVelocity! < -sensitivity) {
      _showPreviousQuestion();
    }
  }

  // MODIFIED: This method now automatically returns to main menu
  void _showGameEndDialog() {
    // Automatically return to main menu when category is completed
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (widget.gameMode) {
      case 'cosy':
        backgroundColor = widget.isDarkMode 
            ? const Color(0xFF6D4C41) // Warmer brown for dark mode
            : const Color(0xFFD7CCC8); // Lighter brown for light mode
        break;
      case 'sexy':
        backgroundColor = widget.isDarkMode 
            ? const Color(0xFFC2185B) // Deeper pink for dark mode
            : const Color(0xFFF8BBD9); // Softer pink for light mode
        break;
      case 'fun':
        backgroundColor = widget.isDarkMode 
            ? const Color(0xFFFF8F00) // Vibrant orange for dark mode
            : const Color(0xFFFFE0B2); // Peach for light mode
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.primary;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: _onSwipe,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Question display
                Expanded(
                  child: Center(
                    child: isLoading 
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            currentQuestion,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                const Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 15,
                                  color: Colors.white,
                                ),
                                const Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                
                // Home button in center
                if (!isLoading)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Navigate to a fresh app instance
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const TalkingGameApp()),
                          (route) => false,
                        );
                      },
                      backgroundColor: Colors.white.withValues(alpha: 0.3),
                      foregroundColor: Colors.white,
                      child: const Icon(Icons.home, size: 28),
                    ),
                  ),
                
                // Swipe instructions at bottom - fixed to bottom
                if (!isLoading)
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left arrow and instruction - now clickable
                            GestureDetector(
                              onTap: usedQuestions.isEmpty ? null : () {
                                _showPreviousQuestion();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: usedQuestions.isEmpty 
                                      ? Colors.transparent 
                                      : Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: usedQuestions.isEmpty 
                                          ? Colors.white30 
                                          : Colors.white70,
                                      size: 20,
                                    ),
                                    Text(
                                      'Previous',
                                      style: GoogleFonts.poppins(
                                        color: usedQuestions.isEmpty 
                                            ? Colors.white30 
                                            : Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            // Center instruction
                            Text(
                              'Swipe or tap arrows',
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                            // Right arrow and instruction - now clickable
                            GestureDetector(
                              onTap: availableQuestions.isEmpty ? null : () {
                                _showNextQuestion();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: availableQuestions.isEmpty 
                                      ? Colors.transparent 
                                      : Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Next',
                                      style: GoogleFonts.poppins(
                                        color: availableQuestions.isEmpty 
                                            ? Colors.white30 
                                            : Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: availableQuestions.isEmpty 
                                          ? Colors.white30 
                                          : Colors.white70,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${usedQuestions.length + 1} of ${usedQuestions.length + availableQuestions.length + 1}',
                          style: GoogleFonts.poppins(
                            color: Colors.white60,
                            fontSize: 12,
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

class RulesPage extends StatelessWidget {
  final bool isDarkMode;
  
  const RulesPage({super.key, required this.isDarkMode});

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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: textColor),
                  ),
                  const SizedBox(height: 20),
                  
                  Text(
                    'How to Play',
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
                  const SizedBox(height: 24),
                  
                  Text(
                    'Setup:',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Choose the number of players (2-10)\n'
                    '• Select your preferred game mode:\n'
                    '  ☕ Cosy - Warm, comfortable conversations\n'
                    '  💋 Sexy - Intimate and romantic questions\n'
                    '  🎉 Fun - Light-hearted and entertaining',
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      height: 1.5,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    'Playing:',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Questions will appear full screen\n'
                    '• Take turns reading and answering questions\n'
                    '• Swipe right for next question, left for previous\n'
                    '• Questions are randomly selected and never repeat',
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      height: 1.5,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    'Game End:',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• When all questions in a category are used up, you will automatically return to the main menu\n'
                    '• You can then start a new game with the same or different settings\n\n'
                    'Remember: The goal is to have meaningful conversations and connect with each other!',
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      height: 1.5,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  Center(
                    child: Text(
                      '🎙️ Enjoy your conversations! 🎙️',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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