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
  late DateTime endTime;
  Duration remainingTime = Duration.zero;
  
  RealtimeChannel? questionsChannel;
  RealtimeChannel? sessionChannel;
  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _startCountdown();
    _subscribeToChanges();
  }

  @override
  void dispose() {
    questionController.dispose();
    countdownTimer?.cancel();
    questionsChannel?.unsubscribe();
    sessionChannel?.unsubscribe();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      // Get participants
      final loadedParticipants = await pandoraService.getParticipants(widget.sessionId);
      
      // Find my participant ID
      final myEmail = Supabase.instance.client.auth.currentUser?.email;
      final myParticipant = loadedParticipants.firstWhere(
        (p) => p['user_email'] == myEmail || p['is_host'] == true,
        orElse: () => loadedParticipants.first,
      );
      
      // Get existing questions
      final loadedQuestions = await pandoraService.getSessionQuestions(widget.sessionId);
      
      setState(() {
        participants = loadedParticipants;
        myParticipantId = myParticipant['id'];
        questions = loadedQuestions;
      });
    } catch (e) {
      debugPrint('Error loading data: $e');
    }
  }

  void _startCountdown() {
    endTime = DateTime.now().add(Duration(minutes: widget.timerMinutes));
    
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = endTime.difference(DateTime.now());
        
        if (remainingTime.isNegative) {
          remainingTime = Duration.zero;
          timer.cancel();
          if (widget.isHost) {
            _startGame();
          }
        }
      });
    });
  }

  void _subscribeToChanges() {
    questionsChannel = pandoraService.subscribeToQuestions(
      widget.sessionId,
      () => _loadData(),
    );

    sessionChannel = pandoraService.subscribeToSession(
      widget.sessionId,
      (session) {
        if (session['status'] == 'playing' && mounted) {
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
    try {
      await pandoraService.startPlaying(widget.sessionId);
      // Navigation happens through subscription
    } catch (e) {
      debugPrint('Error starting game: $e');
    }
  }

  void _navigateToGame() async {
    final sessionQuestions = await pandoraService.getSessionQuestions(widget.sessionId);
    final questionTexts = sessionQuestions.map((q) {
      final targetName = q['target_participant']?['display_name'];
      final questionText = q['question_text'] as String;
      
      if (targetName != null) {
        return '[$targetName] $questionText';
      }
      return questionText;
    }).toList();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GamePage(
            gameMode: 'Pandora',
            category: 'Live Session',
            isDarkMode: widget.isDarkMode,
            customQuestions: questionTexts,
          ),
        ),
      );
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
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
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
                      const Icon(Icons.question_answer, color: Color(0xFFFF6B9D)),
                      const SizedBox(width: 8),
                      Text(
                        '${questions.length} questions submitted',
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
                
                // Question input section
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Colors.white.withValues(alpha: 0.05)
                          : Colors.black.withValues(alpha: 0.02),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Your Question',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Question text field
                        TextField(
                          controller: questionController,
                          maxLines: 3,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Type your question here...',
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
                        
                        const SizedBox(height: 16),
                        
                        // Target selection
                        Text(
                          'Target',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          ),
                        ),
                        
                        const SizedBox(height: 8),
                        
                        // Target type buttons
                        Row(
                          children: [
                            Expanded(
                              child: _buildTargetButton(
                                'Everyone',
                                'all',
                                Icons.group,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildTargetButton(
                                'Specific Player',
                                'specific',
                                Icons.person,
                              ),
                            ),
                          ],
                        ),
                        
                        // Player selector (if specific is selected)
                        if (targetType == 'specific') ...[
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            initialValue: targetParticipantId,
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
                        
                        const Spacer(),
                        
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
                ),
              ],
            ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : ThemeHelper.getBodyTextColor(widget.isDarkMode),
              size: 20,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : ThemeHelper.getBodyTextColor(widget.isDarkMode),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}