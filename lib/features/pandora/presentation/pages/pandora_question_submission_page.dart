// lib/features/pandora/presentation/pages/pandora_question_submission_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/services/pandora_service.dart';
import '../../../game/presentation/pages/game_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/unlock_manager.dart';

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
  final unlockManager = UnlockManager();
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

  void _startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      setState(() {
        remainingTime = endTime.difference(DateTime.now().toUtc());
        
        if (remainingTime.isNegative) {
          remainingTime = Duration.zero;
          timer.cancel();
          if (widget.isHost && !isStartingGame && !hasNavigatedToGame) {
            _startGame();
          }
        }
      });
    });
    
    debugPrint('✅ Question collection started with timer: ${widget.timerMinutes} minutes');
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _checkGameStatus() async {
    try {
      final session = await pandoraService.getSession(widget.sessionId);
      if (session != null && session['status'] == 'playing' && mounted && !hasNavigatedToGame) {
        debugPrint('📡 [Polling] Game started - navigating...');
        hasNavigatedToGame = true;
        _navigateToGame();
      }
    } catch (e) {
      debugPrint('❌ Error checking game status: $e');
    }
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
        // Handle session cancellation
        if (session['status'] == 'cancelled' && mounted) {
          debugPrint('🚫 Session cancelled by host');
          _handleSessionCancellation();
        }
      },
    );
  }

  void _handleSessionCancellation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Session cancelled by host'),
        backgroundColor: Colors.red,
      ),
    );
    
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });
  }

  Future<void> _submitQuestion() async {
    final l10n = AppLocalizations.of(context)!;
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
// Check question limit for freemium users
if (!unlockManager.isPremium) {
  final myQuestions = questions.where((q) => q['participant_id'] == myParticipantId).length;
  if (myQuestions >= 12) {
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.freemiumQuestionLimit),
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: l10n.getPremium,
          textColor: Colors.white,
          onPressed: () {
            // Navigate to subscription page
          },
        ),
      ),
    );
    return;
  }
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
          SnackBar(
            content: Text(l10n.questionSubmitted),
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
        } else {
          return questionText;
        }
      }).toList();
      
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => GamePage(
              gameMode: 'pandora',
              category: 'pandora',
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

  Future<void> _cancelSession() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await pandoraService.cancelSession(widget.sessionId);
      debugPrint('🚫 Session cancelled by host');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.sessionCancelled),
            backgroundColor: Colors.orange,
          ),
        );
        
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      debugPrint('❌ Error cancelling session: $e');
    }
  }

  Widget _buildTargetButton(String label, String type, IconData icon) {
    final isSelected = targetType == type;
    
    return GestureDetector(
      onTap: () => setState(() => targetType = type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B9D) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PopScope(
  canPop: false, // Changed from !widget.isHost to false - always prevent default back
  onPopInvokedWithResult: (bool didPop, dynamic result) async {
    if (didPop) return;
    
    
    // Host confirms cancellation, players just leave
    if (widget.isHost) {
      final shouldCancel = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.cancelSession, style: GoogleFonts.poppins()),
          content: Text(
            l10n.cancelSessionForAll,
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.no, style: GoogleFonts.poppins()),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(l10n.yesCancel, style: GoogleFonts.poppins()),
            ),
          ],
        ),
      );
      
      if (shouldCancel == true && mounted) {
        await _cancelSession();
      }
    } else {
      // Players can leave without confirmation
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  },
      child: Scaffold(
        backgroundColor: widget.isDarkMode ? const Color(0xFF2D1B2E) : const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
  icon: Icon(
    widget.isHost ? Icons.close : Icons.arrow_back,
    color: widget.isDarkMode ? Colors.white : Colors.black87,
  ),
  onPressed: () async {
    final l10n = AppLocalizations.of(context)!;
    
    if (widget.isHost) {
      final shouldCancel = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.cancelSession, style: GoogleFonts.poppins()),
          content: Text(
            l10n.cancelSessionForAll,
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.no, style: GoogleFonts.poppins()),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(l10n.yesCancel, style: GoogleFonts.poppins()),
            ),
          ],
        ),
      );
      
      if (shouldCancel == true && mounted) {
        await _cancelSession();
      }
    } else {
      // Players can leave without confirmation
      Navigator.of(context).pop();
    }
  },
),
          title: Text(
            widget.isHost 
                ? l10n.hostQuestionCollection 
                : l10n.questionCollectionTime,
            style: GoogleFonts.poppins(
              color: widget.isDarkMode ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Timer display
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF6B9D), Color(0xFFFF8E53)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer, color: Colors.white, size: 28),
                      const SizedBox(width: 12),
                      Text(
                        _formatTime(remainingTime),
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Questions count
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
                      Icon(
                        Icons.question_answer,
                        color: const Color(0xFFFF6B9D),
                      ),
                      const SizedBox(width: 12),
                      Column(
  children: [
    Text(
      l10n.questionsSubmitted(questions.length),
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: widget.isDarkMode ? Colors.white70 : Colors.black87,
      ),
    ),
    if (!unlockManager.isPremium && myParticipantId != null) ...[
      const SizedBox(height: 4),
      Builder(
        builder: (context) {
          final myQuestions = questions.where((q) => q['participant_id'] == myParticipantId).length;
          return Text(
            '${l10n.yourQuestions}: $myQuestions/12',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: myQuestions >= 12 ? Colors.orange : (widget.isDarkMode ? Colors.white54 : Colors.black54),
              fontWeight: myQuestions >= 12 ? FontWeight.bold : FontWeight.normal,
            ),
          );
        },
      ),
    ],
  ],
),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Scrollable form
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question input
                        Text(
                          l10n.yourQuestion,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: widget.isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                        
                        const SizedBox(height: 12),
                        
                        TextField(
                          controller: questionController,
                          maxLines: 4,
                          style: GoogleFonts.poppins(
                            color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: l10n.typeQuestionHere,
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                            ),
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
                          l10n.whoIsThisFor,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: widget.isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // Target buttons
                        Row(
                          children: [
                            Expanded(
                              child: _buildTargetButton(l10n.everyone, 'all', Icons.groups),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildTargetButton(l10n.specific, 'specific', Icons.person),
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
                              color: widget.isDarkMode ? Colors.white : Colors.black87,
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
                            hint: Text(l10n.selectPlayer),
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
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    l10n.submitQuestion,
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
                
                const SizedBox(height: 16),
                
                // Host start button
                if (widget.isHost)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: (isStartingGame || questions.length < 5)
                          ? null
                          : _startGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isStartingGame
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              questions.length < 5
                                  ? l10n.needMoreQuestions(5 - questions.length)
                                  : l10n.startGame,

                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
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
}