// lib/features/pandora/presentation/pages/pandora_question_submission_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/services/pandora_service.dart';
import '../../../game/presentation/pages/game_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../subscription/presentation/pages/subscription_page.dart';

class PandoraQuestionSubmissionPage extends ConsumerStatefulWidget {
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
  ConsumerState<PandoraQuestionSubmissionPage> createState() =>
      _PandoraQuestionSubmissionPageState();
}



class _PandoraQuestionSubmissionPageState
    extends ConsumerState<PandoraQuestionSubmissionPage> {
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
  bool _hasBeenKicked = false;

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
// participantsChannel?.unsubscribe();  // Already covered by other channels
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
        // Find my participant ID BEFORE setState
        final userEmail = Supabase.instance.client.auth.currentUser?.email;
        
        // Try to find by email first, then by host status as fallback
        Map<String, dynamic>? myParticipant;
        if (userEmail != null) {
          myParticipant = loadedParticipants.firstWhere(
            (p) => p['user_email'] == userEmail,
            orElse: () => loadedParticipants.firstWhere(
              (p) => p['is_host'] == widget.isHost,
              orElse: () => loadedParticipants.first,
            ),
          );
        } else {
          // No email - use host status or first participant
          myParticipant = loadedParticipants.firstWhere(
            (p) => p['is_host'] == widget.isHost,
            orElse: () => loadedParticipants.first,
          );
        }
        
        final foundId = myParticipant['id'] as String;
        
        debugPrint('🔍 My participant ID: $foundId (email: $userEmail, isHost: ${widget.isHost})');
        debugPrint('🔍 All participants: ${loadedParticipants.map((p) => '${p["display_name"]} (${p["id"]})').join(", ")}');
        
        setState(() {
          participants = loadedParticipants;
          myParticipantId = foundId;
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
        
        // Timer expired!
        if (widget.isHost && !isStartingGame && !hasNavigatedToGame) {
          debugPrint('⏰ Timer expired! Checking if we can start game...');
          
          // Check if we have enough questions (minimum 5)
          if (questions.length >= 5) {
            debugPrint('✅ Enough questions (${questions.length}) - starting game');
            _startGame();
          } else {
            debugPrint('❌ Not enough questions (${questions.length}/5) - ending session');
            _timeoutSession();
          }
        }
      }
    });
  });
  
  debugPrint('✅ Question collection started with timer: ${widget.timerMinutes} minutes');
}

// Add this new method to handle timeout
Future<void> _timeoutSession() async {
  try {
    final l10n = AppLocalizations.of(context)!;
    
    // End the session
    await pandoraService.endSession(widget.sessionId);
    
    if (mounted) {
      // Show dialog to all players
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(
            '⏰ ${l10n.timeIsUp}',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Text(
            l10n.notEnoughQuestionsSubmitted(questions.length, 5),
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('OK', style: GoogleFonts.poppins()),
            ),
          ],
        ),
      );
    }
  } catch (e) {
    debugPrint('❌ Error timing out session: $e');
  }
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

    // Subscribe to participants to detect if kicked (non-hosts only)
    RealtimeChannel? participantsChannel;
    if (!widget.isHost) {
      participantsChannel = pandoraService.subscribeToParticipants(
        widget.sessionId,
        () async {
          if (_hasBeenKicked) return;
          
          debugPrint('👥 Participants changed - checking if kicked');
          final newParticipants = await pandoraService.getParticipants(widget.sessionId);
          final stillInSession = newParticipants.any((p) => p['id'] == myParticipantId);
          
          if (!stillInSession && mounted && !_hasBeenKicked) {
            _hasBeenKicked = true;
            debugPrint('🚫 Player was kicked during question submission');
            
            final l10n = AppLocalizations.of(context)!;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.youWereKicked),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
            
            // Navigate back to home
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
      );
    }

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
      SnackBar(content: Text(l10n.pleaseEnterQuestion)),
    );
    return;
  }

  if (targetType == 'specific' && targetParticipantId == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.selectPlayer)),
    );
    return;
  }

  // NEW: Check SESSION-WIDE question limit for freemium hosts
  final session = await pandoraService.getSession(widget.sessionId);
  final hostIsPremium = session?['host_is_premium'] ?? false;
  
  if (!hostIsPremium) {
    // Count TOTAL questions in the session (not per user)
    final totalQuestions = questions.length;
    
    if (totalQuestions >= 12) {
      debugPrint('❌ Session question limit reached: $totalQuestions/12');
      
      // Show premium dialog
      if (!mounted) return;
showDialog(
  context: context,
  builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              const Icon(Icons.lock, color: Color(0xFFFF6B9D), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.sessionQuestionLimit,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.sessionQuestionLimitMessage,
                style: GoogleFonts.poppins(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B9D).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.workspace_premium,
                      color: Color(0xFFFFD700),
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.getPremium,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Unlimited questions & players',
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                l10n.mayBeLater,
                style: GoogleFonts.poppins(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (!mounted) return;
Navigator.pop(context);
if (!mounted) return;
Navigator.push(
  context,
  MaterialPageRoute(
                    builder: (context) => SubscriptionPage(
                      isDarkMode: widget.isDarkMode,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B9D),
                foregroundColor: Colors.white,
              ),
              child: Text(
                l10n.subscribe,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
      return;
    }
  }

  // Continue with question submission...
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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.questionSubmitted),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $e'),
        backgroundColor: Colors.red,
      ),
    );
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
      
      // Only cancel if user confirmed (true), otherwise do nothing
      if (shouldCancel == true) {
        if (mounted) {
          await _cancelSession();
        }
      }
      // If shouldCancel is false or null, dialog was cancelled - do nothing (this is correct)
    } else {
      // Players can leave without confirmation
      if (mounted) {
        Navigator.of(context).pop();
      }
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
                
                const SizedBox(height: 20),
                
                // Questions count with session-wide limit indicator
                Column(
                  children: [
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
                          Text(
                            l10n.questionsSubmitted(questions.length),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Show session-wide question limit for freemium hosts
                    const SizedBox(height: 12),
                    FutureBuilder<Map<String, dynamic>?>(
                      future: pandoraService.getSession(widget.sessionId),
                      builder: (context, snapshot) {
                        final hostIsPremium = snapshot.data?['host_is_premium'] ?? false;
                        
                        if (!hostIsPremium) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: questions.length >= 12
                                  ? Colors.red.withValues(alpha: 0.1)
                                  : Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: questions.length >= 12
                                    ? Colors.red.withValues(alpha: 0.3)
                                    : Colors.orange.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  questions.length >= 12 ? Icons.lock : Icons.info_outline,
                                  color: questions.length >= 12 ? Colors.red : Colors.orange,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.sessionQuestionCount(questions.length),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: widget.isDarkMode
                                        ? Colors.white
                                        : const Color(0xFF2D1B2E),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
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
                          Builder(
                            builder: (context) {
                              debugPrint('🎯 Building dropdown - myParticipantId: $myParticipantId');
                              
                              return DropdownButtonFormField<String>(
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
                                items: participants.map((p) {
                                  final participantId = p['id'] as String;
                                  final isMe = participantId == myParticipantId;
                                  final displayName = p['display_name'] as String;
                                  final label = isMe ? '$displayName (${l10n.you})' : displayName;
                                  
                                  debugPrint('  - $displayName: id=$participantId, isMe=$isMe (comparing with $myParticipantId)');
                                  
                                  return DropdownMenuItem<String>(
                                    value: participantId,
                                    child: Text(
                                      label,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: widget.isDarkMode ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => targetParticipantId = value);
                                },
                              );
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
        
          
        
  
  
