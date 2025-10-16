// lib/features/pandora/presentation/pages/pandora_question_submission_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import '../../../game/presentation/pages/game_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PandoraQuestionSubmissionPage extends StatefulWidget {
  final String sessionId;
  final bool isHost;
  final int timerMinutes;
  final bool isDarkMode;
  
  const PandoraQuestionSubmissionPage({
    super.key,
    required this.sessionId,
    required this.isHost,
    required this.timerMinutes,
    required this.isDarkMode,
  });

  @override
  State<PandoraQuestionSubmissionPage> createState() =>
      _PandoraQuestionSubmissionPageState();
}

class _PandoraQuestionSubmissionPageState
    extends State<PandoraQuestionSubmissionPage> {
  final pandoraService = PandoraService();
  final questionController = TextEditingController();
  
  List<Map<String, dynamic>> participants = [];
  List<Map<String, dynamic>> questions = [];
  String? myParticipantId;
  String targetType = 'all';
  String? targetParticipantId;
  
  Timer? countdownTimer;
  Timer? pollTimer;
  Timer? statusPollTimer;
  late DateTime endTime;
  Duration remainingTime = Duration.zero;
  
  RealtimeChannel? questionsChannel;
  RealtimeChannel? sessionChannel;
  bool isSubmitting = false;
  bool isStartingGame = false;
  bool hasNavigatedToGame = false;

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now();
    _loadData();
    _subscribeToChanges();
    
    // Poll questions every 2 seconds as backup
    pollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _loadQuestions();
    });
    
    // Poll session status every 1 second (for players to detect game start)
    statusPollTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || hasNavigatedToGame) {
        timer.cancel();
        return;
      }
      _checkGameStatus();
    });
  }

  @override
  void dispose() {
    questionController.dispose();
    countdownTimer?.cancel();
    pollTimer?.cancel();
    statusPollTimer?.cancel();
    questionsChannel?.unsubscribe();
    sessionChannel?.unsubscribe();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      // Get session to retrieve timer_started_at
      final session = await pandoraService.getSession(widget.sessionId);
      
      if (session == null) {
        debugPrint('❌ Session not found!');
        return;
      }
      
      // Calculate end time based on timer_started_at
      final timerStartedAt = session['timer_started_at'];
      if (timerStartedAt != null) {
        final startTime = DateTime.parse(timerStartedAt as String).toUtc();
        endTime = startTime.add(Duration(minutes: widget.timerMinutes));
        debugPrint('⏰ Timer started at: $startTime, ends at: $endTime');
      }
      
      // Load participants and questions
      await Future.wait([
        _loadParticipants(),
        _loadQuestions(),
      ]);
      
      // Start countdown
      _startCountdown();
    } catch (e) {
      debugPrint('❌ Error loading data: $e');
    }
  }

  Future<void> _loadParticipants() async {
    try {
      final loadedParticipants = await pandoraService.getParticipants(widget.sessionId);
      if (mounted) {
        setState(() {
          participants = loadedParticipants;
          
          // Find my participant ID
          final userEmail = Supabase.instance.client.auth.currentUser?.email;
          myParticipantId = participants
              .firstWhere(
                (p) => p['user_email'] == userEmail || p['is_host'] == widget.isHost,
                orElse: () => participants.first,
              )['id'];
        });
        debugPrint('👥 Loaded ${participants.length} participants');
      }
    } catch (e) {
      debugPrint('❌ Error loading participants: $e');
    }
  }

  Future<void> _loadQuestions() async {
    try {
      final loadedQuestions = await pandoraService.getSessionQuestions(widget.sessionId);
      if (mounted) {
        setState(() {
          questions = loadedQuestions;
        });
        debugPrint('📝 Loaded ${questions.length} questions');
      }
    } catch (e) {
      debugPrint('❌ Error loading questions: $e');
    }
  }

  Future<void> _checkGameStatus() async {
    if (hasNavigatedToGame) return;
    
    try {
      final session = await pandoraService.getSession(widget.sessionId);
      if (session != null && session['status'] == 'playing') {
        debugPrint('🔍 [Polling] Game started - navigating...');
        hasNavigatedToGame = true;
        _navigateToGame();
      }
    } catch (e) {
      debugPrint('❌ Error checking game status: $e');
    }
  }

  void _startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      final now = DateTime.now().toUtc();
      final remaining = endTime.difference(now);
      
      setState(() {
        remainingTime = remaining;
        
        if (remainingTime.isNegative || remainingTime.inSeconds <= 0) {
          remainingTime = Duration.zero;
          timer.cancel();
          if (widget.isHost && !isStartingGame && questions.length >= 5) {
            debugPrint('⏰ Timer expired - starting game automatically');
            _startGame();
          } else if (widget.isHost && questions.length < 5) {
            debugPrint('⏰ Timer expired but only ${questions.length} questions - need 5 minimum');
          }
        }
      });
    });
  }

  void _subscribeToChanges() {
    questionsChannel = pandoraService.subscribeToQuestions(
      widget.sessionId,
      () {
        debugPrint('📡 Questions changed - reloading');
        _loadQuestions();
      },
    );

    sessionChannel = pandoraService.subscribeToSession(
      widget.sessionId,
      (session) {
        debugPrint('📡 Session status update: ${session['status']}');
        if (session['status'] == 'playing' && mounted && !hasNavigatedToGame) {
          debugPrint('📡 [Real-time] Game started - navigating...');
          hasNavigatedToGame = true;
          _navigateToGame();
        }
      },
    );
  }

  Future<void> _submitQuestion() async {
    if (questionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a question')),
      );
      return;
    }

    if (targetType == 'specific' && targetParticipantId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a target player')),
      );
      return;
    }

    setState(() => isSubmitting = true);

    try {
      await pandoraService.submitQuestion(
        sessionId: widget.sessionId,
        participantId: myParticipantId!,
        questionText: questionController.text.trim(),
        targetType: targetType,
        targetParticipantId: targetParticipantId,
      );

      questionController.clear();
      setState(() {
        targetType = 'all';
        targetParticipantId = null;
      });

      // Immediately reload questions
      await _loadQuestions();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Question submitted!'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  Future<void> _startGame() async {
    if (isStartingGame || hasNavigatedToGame) return;
    
    // Validate minimum questions
    if (questions.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Need at least 5 questions to start! (Currently: ${questions.length})'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    setState(() => isStartingGame = true);
    
    try {
      debugPrint('🎮 Starting game...');
      await pandoraService.startPlaying(widget.sessionId);
      
      // Give a moment for the status to update
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Navigate immediately
      if (mounted && !hasNavigatedToGame) {
        hasNavigatedToGame = true;
        _navigateToGame();
      }
    } catch (e) {
      debugPrint('❌ Error starting game: $e');
      if (mounted) {
        setState(() => isStartingGame = false);
        hasNavigatedToGame = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error starting game: $e')),
        );
      }
    }
  }

  void _navigateToGame() async {
    if (hasNavigatedToGame && !mounted) return;
    
    try {
      debugPrint('🎮 Navigating to game...');
      
      final sessionQuestions = await pandoraService.getSessionQuestions(widget.sessionId);
      
      if (sessionQuestions.length < 5) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Need at least 5 questions! (Currently: ${sessionQuestions.length})'),
              backgroundColor: Colors.orange,
            ),
          );
          setState(() {
            isStartingGame = false;
            hasNavigatedToGame = false;
          });
        }
        return;
      }
      
      final questionTexts = sessionQuestions.map((q) {
        final targetName = q['target_participant']?['display_name'];
        final questionText = q['question_text'] as String;
        
        if (targetName != null) {
          return '[$targetName] $questionText';
        }
        return questionText;
      }).toList();

      debugPrint('🎮 Navigating with ${questionTexts.length} questions');

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GamePage(
              gameMode: 'Pandora',
              category: 'Live Session',
              isDarkMode: widget.isDarkMode,
              customQuestions: questionTexts,
              sessionId: widget.sessionId,
              isHost: widget.isHost,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('❌ Error navigating to game: $e');
      if (mounted) {
        setState(() {
          isStartingGame = false;
          hasNavigatedToGame = false;
        });
      }
    }
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.defaultPadding),
                      child: Column(
                        children: [
                          // Timer display
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF6B9D), Color(0xFFFF8E53)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  _formatTime(remainingTime),
                                  style: GoogleFonts.poppins(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Questions submitted counter
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.1)
                                  : Colors.black.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.question_answer,
                                  color: Color(0xFFFF6B9D),
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Questions submitted: ${questions.length}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Minimum questions warning (show if less than 5)
                          if (widget.isHost && questions.length < 5) ...[
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.orange, width: 2),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.info_outline, color: Colors.orange),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'Need ${5 - questions.length} more question${5 - questions.length == 1 ? '' : 's'} to start (minimum 5)',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                          
                          // Host start game button
                          if (widget.isHost) ...[
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: isStartingGame || questions.length < 5 ? null : _startGame,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4CAF50),
                                  foregroundColor: Colors.white,
                                  disabledBackgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                icon: isStartingGame
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Icon(Icons.play_arrow),
                                label: Text(
                                  isStartingGame
                                      ? 'Starting Game...'
                                      : questions.length < 5
                                          ? 'Need ${5 - questions.length} More'
                                          : 'Start Game Now',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                          
                          // Question input card
                          Container(
                            constraints: BoxConstraints(
                              minHeight: 300,
                              maxHeight: MediaQuery.of(context).size.height * 0.5,
                            ),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.1)
                                  : Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Submit Your Question',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                  ),
                                ),
                                
                                const SizedBox(height: 20),
                                
                                // Question input
                                TextField(
                                  controller: questionController,
                                  maxLines: 3,
                                  minLines: 2,
                                  style: GoogleFonts.poppins(
                                    color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your question here...',
                                    filled: true,
                                    fillColor: widget.isDarkMode
                                        ? Colors.white.withValues(alpha: 0.1)
                                        : Colors.black.withValues(alpha: 0.05),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                
                                const SizedBox(height: 20),
                                
                                // Target selection
                                Text(
                                  'Who is this for?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                  ),
                                ),
                                
                                const SizedBox(height: 12),
                                
                                // Target buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTargetButton('Everyone', 'all', Icons.groups),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTargetButton('Specific Player', 'specific', Icons.person),
                                    ),
                                  ],
                                ),
                                
                                if (targetType == 'specific') ...[
                                  const SizedBox(height: 16),
                                  DropdownButtonFormField<String>(
                                    initialValue: targetParticipantId,
                                    dropdownColor: widget.isDarkMode
                                        ? const Color(0xFF2D2D2D)
                                        : Colors.white,
                                    style: GoogleFonts.poppins(
                                      color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: widget.isDarkMode
                                          ? Colors.white.withValues(alpha: 0.1)
                                          : Colors.black.withValues(alpha: 0.05),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    hint: Text('Select a player'),
                                    items: participants
                                        .where((p) => p['id'] != myParticipantId)
                                        .map((p) => DropdownMenuItem<String>(
                                              value: p['id'],
                                              child: Text(p['display_name']),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() => targetParticipantId = value);
                                    },
                                  ),
                                ],
                                
                                const SizedBox(height: 20),
                                
                                // Submit button
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: isSubmitting ? null : _submitQuestion,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF6B9D),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: isSubmitting
                                        ? const CircularProgressIndicator(color: Colors.white)
                                        : Text(
                                            'Submit Question',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTargetButton(String label, String value, IconData icon) {
    final isSelected = targetType == value;
    
    return GestureDetector(
      onTap: () => setState(() => targetType = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFF6B9D)
              : (widget.isDarkMode
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF6B9D)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : ThemeHelper.getBodyTextColor(widget.isDarkMode),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    : ThemeHelper.getBodyTextColor(widget.isDarkMode),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}