import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:math';
import 'dart:convert';

void main() {
  runApp(const TalkingGameApp());
}

class TalkingGameApp extends StatelessWidget {
  const TalkingGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talking Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenuPage(),
      },
    );
  }
}

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Talking Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // App Title
            const Text(
              '🎙️ Talking Game',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            
            // Start Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayerSelectionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
              ),
              child: const Text(
                'Start',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            
            // Rules Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RulesPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
              ),
              child: const Text(
                'Rules',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            
            // Credits Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreditsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
              ),
              child: const Text(
                'Credits',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerSelectionPage extends StatefulWidget {
  const PlayerSelectionPage({super.key});

  @override
  State<PlayerSelectionPage> createState() => _PlayerSelectionPageState();
}

class _PlayerSelectionPageState extends State<PlayerSelectionPage> {
  int selectedPlayers = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Select Players'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'How many players?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '$selectedPlayers Players',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
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
                      style: const TextStyle(fontSize: 24),
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
                    builder: (context) => GameModeSelectionPage(playerCount: selectedPlayers),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameModeSelectionPage extends StatelessWidget {
  final int playerCount;
  
  const GameModeSelectionPage({super.key, required this.playerCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Choose Game Mode'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your game mode',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            
            // Cosy Mode
            ElevatedButton.icon(
              onPressed: () => _selectMode(context, 'cosy'),
              icon: const Text('☕', style: TextStyle(fontSize: 24)),
              label: const Text('Cosy', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 80),
                backgroundColor: Colors.brown.shade300,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            
            // Sexy Mode
            ElevatedButton.icon(
              onPressed: () => _selectMode(context, 'sexy'),
              icon: const Text('💋', style: TextStyle(fontSize: 24)),
              label: const Text('Sexy', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 80),
                backgroundColor: Colors.pink.shade400,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            
            // Fun Mode
            ElevatedButton.icon(
              onPressed: () => _selectMode(context, 'fun'),
              icon: const Text('🎉', style: TextStyle(fontSize: 24)),
              label: const Text('Fun', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 80),
                backgroundColor: Colors.orange.shade400,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectMode(BuildContext context, String mode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Timer'),
          content: const Text('Do you want a timer on questions to increase intensity?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Go directly to game without timer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamePage(
                      playerCount: playerCount,
                      gameMode: mode,
                      hasTimer: false,
                      timerMinutes: 0,
                      timerSeconds: 0,
                    ),
                  ),
                );
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Go to timer selection
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerSelectionPage(
                      playerCount: playerCount,
                      gameMode: mode,
                    ),
                  ),
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class TimerSelectionPage extends StatefulWidget {
  final int playerCount;
  final String gameMode;
  
  const TimerSelectionPage({
    super.key,
    required this.playerCount,
    required this.gameMode,
  });

  @override
  State<TimerSelectionPage> createState() => _TimerSelectionPageState();
}

class _TimerSelectionPageState extends State<TimerSelectionPage> {
  int selectedMinutes = 1;
  int selectedSeconds = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Set Timer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Set question timer',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '${selectedMinutes}m ${selectedSeconds}s',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Minutes picker
                Column(
                  children: [
                    const Text('Minutes', style: TextStyle(fontSize: 18)),
                    SizedBox(
                      height: 150,
                      width: 100,
                      child: CupertinoPicker(
                        itemExtent: 40,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            selectedMinutes = value;
                          });
                        },
                        children: List.generate(6, (index) { // 0-5 minutes
                          return Center(
                            child: Text(
                              '$index',
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                
                // Seconds picker
                Column(
                  children: [
                    const Text('Seconds', style: TextStyle(fontSize: 18)),
                    SizedBox(
                      height: 150,
                      width: 100,
                      child: CupertinoPicker(
                        itemExtent: 40,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            selectedSeconds = value * 15; // 0, 15, 30, 45
                          });
                        },
                        children: List.generate(4, (index) {
                          return Center(
                            child: Text(
                              '${index * 15}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamePage(
                      playerCount: widget.playerCount,
                      gameMode: widget.gameMode,
                      hasTimer: true,
                      timerMinutes: selectedMinutes,
                      timerSeconds: selectedSeconds,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
              ),
              child: const Text(
                'Start Game',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  final int playerCount;
  final String gameMode;
  final bool hasTimer;
  final int timerMinutes;
  final int timerSeconds;
  
  const GamePage({
    super.key,
    required this.playerCount,
    required this.gameMode,
    required this.hasTimer,
    required this.timerMinutes,
    required this.timerSeconds,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Map<String, List<String>> questions = {};
  List<String> availableQuestions = [];
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
      // Fallback to hardcoded questions if JSON fails
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
      currentQuestion = availableQuestions[questionIndex];
      availableQuestions.removeAt(questionIndex);
    });

    if (widget.hasTimer) {
      _startTimer();
    }
  }

  void _startTimer() {
    timer?.cancel();
    remainingSeconds = (widget.timerMinutes * 60) + widget.timerSeconds;
    
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
          _showNextQuestion();
        }
      });
    });
  }

  void _showGameEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No More Questions!'),
          content: const Text('You want to choose another category?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenuPage()),
                  (route) => false,
                );
              },
              child: const Text('No - Go Home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameModeSelectionPage(
                      playerCount: widget.playerCount,
                    ),
                  ),
                );
              },
              child: const Text('Yes - Choose Category'),
            ),
          ],
        );
      },
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (widget.gameMode) {
      case 'cosy':
        backgroundColor = Colors.brown.shade400;
        break;
      case 'sexy':
        backgroundColor = Colors.pink.shade500;
        break;
      case 'fun':
        backgroundColor = Colors.orange.shade500;
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.primary;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (!isLoading) {
              timer?.cancel();
              _showNextQuestion();
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Timer display (if enabled)
                if (widget.hasTimer)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      _formatTime(remainingSeconds),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                
                // Question display
                Expanded(
                  child: Center(
                    child: isLoading 
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            currentQuestion,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                
                // Instruction
                if (!isLoading)
                  const Text(
                    'Tap anywhere for next question',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      // Home button in bottom right corner
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show confirmation dialog before going home
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Exit Game'),
                content: const Text('Are you sure you want to exit the game and go home?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      timer?.cancel(); // Stop timer
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainMenuPage()),
                        (route) => false,
                      );
                    },
                    child: const Text('Exit'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.white.withValues(alpha: 0.2),
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Rules'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How to Play',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              
              Text(
                'Setup:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Choose the number of players (2-10)\n'
                '• Select your preferred game mode:\n'
                '  ☕ Cosy - Warm, comfortable conversations\n'
                '  💋 Sexy - Intimate and romantic questions\n'
                '  🎉 Fun - Light-hearted and entertaining\n'
                '• Decide if you want a timer for added intensity',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 24),
              
              Text(
                'Playing:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Questions will appear full screen\n'
                '• Take turns reading and answering questions\n'
                '• Tap anywhere on the screen for the next question\n'
                '• If timer is enabled, it will count down at the top\n'
                '• Questions are randomly selected and never repeat',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 24),
              
              Text(
                'Game End:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• When all questions in a category are used up, you can:\n'
                '  - Choose a different category to continue\n'
                '  - Return to the main menu to start over\n\n'
                'Remember: The goal is to have meaningful conversations and connect with each other!',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 32),
              
              Center(
                child: Text(
                  '🎙️ Enjoy your conversations! 🎙️',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Credits'),
        centerTitle: true,
      ),
      body: Center(
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
            const Text(
              'Made for my beautiful wife',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            
            Text(
              'Otilia Stenhøj',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
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
            
            const Text(
              'With love and conversations',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}