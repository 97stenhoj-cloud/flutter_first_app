// lib/features/pandora/presentation/pages/pandora_lobby_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import 'pandora_timer_selection_page.dart';
import 'pandora_question_submission_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PandoraLobbyPage extends StatefulWidget {
  final String sessionId;
  final String sessionPin;
  final bool isHost;
  final bool isDarkMode;
  
  const PandoraLobbyPage({
    super.key,
    required this.sessionId,
    required this.sessionPin,
    required this.isHost,
    required this.isDarkMode,
  });

  @override
  State<PandoraLobbyPage> createState() => _PandoraLobbyPageState();
}

class _PandoraLobbyPageState extends State<PandoraLobbyPage> {
  final pandoraService = PandoraService();
  List<Map<String, dynamic>> participants = [];
  RealtimeChannel? participantsChannel;
  RealtimeChannel? sessionChannel;
  bool isLoading = true;
  bool _hasNavigated = false;
  
  Timer? lobbyTimer;
  late DateTime lobbyEndTime;
  Duration remainingTime = const Duration(minutes: 15);

  @override
  void initState() {
    super.initState();
    lobbyEndTime = DateTime.now().add(const Duration(minutes: 15));
    _startLobbyTimer();
    _loadParticipants();
    _subscribeToChanges();
    
    // Periodic refresh to ensure updates (backup for real-time)
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _loadParticipants();
      
      // Also check session status as fallback
      if (!widget.isHost) {
        _checkSessionStatus();
      }
    });
  }

  @override
  void dispose() {
    participantsChannel?.unsubscribe();
    sessionChannel?.unsubscribe();
    lobbyTimer?.cancel();
    super.dispose();
  }
  
  void _startLobbyTimer() {
    lobbyTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = lobbyEndTime.difference(DateTime.now());
        
        if (remainingTime.isNegative) {
          remainingTime = Duration.zero;
          timer.cancel();
          if (widget.isHost && mounted) {
            _proceedToTimerSelection();
          }
        }
      });
    });
  }
  
  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _loadParticipants() async {
    try {
      final loadedParticipants = await pandoraService.getParticipants(widget.sessionId);
      if (mounted) {
        setState(() {
          participants = loadedParticipants;
          isLoading = false;
        });
        debugPrint('🔄 [Lobby] Loaded ${participants.length} participants');
      }
    } catch (e) {
      debugPrint('❌ [Lobby] Error loading participants: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading participants: $e')),
        );
      }
    }
  }

  Future<void> _checkSessionStatus() async {
    if (_hasNavigated) return;
    
    try {
      final session = await pandoraService.getSession(widget.sessionId);
      if (session != null && session['status'] == 'collecting_questions') {
        debugPrint('🔍 [Lobby Polling] Found collecting_questions status');
        _handleStatusChange(session);
      }
    } catch (e) {
      debugPrint('❌ [Lobby] Error checking status: $e');
    }
  }

  void _handleStatusChange(Map<String, dynamic> session) {
    if (_hasNavigated) return;
    
    final status = session['status'];
    debugPrint('📡 [Lobby] Handling status: $status');
    
    if (status == 'collecting_questions' && mounted && !widget.isHost) {
      _hasNavigated = true;
      final timerMinutes = session['timer_minutes'] as int? ?? 5;
      debugPrint('✅ [Lobby Player] Navigating to question submission with timer: $timerMinutes');
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PandoraQuestionSubmissionPage(
            sessionId: widget.sessionId,
            isHost: false,
            timerMinutes: timerMinutes,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );
    }
  }

  void _subscribeToChanges() {
    debugPrint('🔌 [Lobby] Setting up real-time subscriptions');
    
    // Subscribe to participants changes
    participantsChannel = pandoraService.subscribeToParticipants(
      widget.sessionId,
      () {
        debugPrint('👥 [Lobby] Participants changed - reloading');
        _loadParticipants();
      },
    );

    // Subscribe to session status changes
    sessionChannel = pandoraService.subscribeToSession(
      widget.sessionId,
      (session) {
        debugPrint('📡 [Lobby] Real-time session update: ${session['status']}');
        
        if (_hasNavigated) return;
        
        final status = session['status'];
        
        if (status == 'timer_selection' && mounted && widget.isHost) {
          // Navigate to timer selection page (host only)
          _hasNavigated = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PandoraTimerSelectionPage(
                sessionId: widget.sessionId,
                isDarkMode: widget.isDarkMode,
              ),
            ),
          );
        } else if (status == 'collecting_questions' && mounted && !widget.isHost) {
          // Players navigate to question submission
          _handleStatusChange(session);
        }
      },
    );
  }
  
  void _proceedToTimerSelection() {
    if (!widget.isHost || _hasNavigated) return;
    
    _hasNavigated = true;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PandoraTimerSelectionPage(
          sessionId: widget.sessionId,
          isDarkMode: widget.isDarkMode,
        ),
      ),
    );
  }

  void _copyPinToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.sessionPin));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PIN copied to clipboard!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !widget.isHost,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        
        // Confirm exit for host
        if (widget.isHost) {
          final shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('End Session?'),
              content: const Text('Are you sure you want to end this Pandora session?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('End Session'),
                ),
              ],
            ),
          );
          
          if (shouldExit == true && context.mounted) {
            await pandoraService.endSession(widget.sessionId);
            if (context.mounted) {
              Navigator.pop(context);
            }
          }
        }
      },
      child: Scaffold(
        body: Container(
          decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                children: [
                  // Header with timeout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.isHost ? 'Hosting Pandora' : 'Joined Pandora',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: _loadParticipants,
                        icon: Icon(
                          Icons.refresh,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          size: 24,
                        ),
                        tooltip: 'Refresh participants',
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                  
                  if (widget.isHost)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: remainingTime.inMinutes < 5 
                          ? [const Color(0xFFFF6B9D), const Color(0xFFFF4081)]
                          : [const Color(0xFF7C4DFF), const Color(0xFF536DFE)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Join time: ${_formatTime(remainingTime)}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                  
                  const SizedBox(height: 20),
                  
                  // PIN Display
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6B9D), Color(0xFFFF8E53)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Session PIN',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.sessionPin,
                              style: GoogleFonts.poppins(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 8,
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: _copyPinToClipboard,
                              icon: const Icon(
                                Icons.copy,
                                color: Colors.white,
                                size: 28,
                              ),
                              tooltip: 'Copy PIN',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Participants section
                  Text(
                    'Participants (${participants.length})',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Participants list
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : participants.isEmpty
                            ? Center(
                                child: Text(
                                  'Waiting for participants...',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: participants.length,
                                itemBuilder: (context, index) {
                                  final participant = participants[index];
                                  final isHost = participant['is_host'] as bool;
                                  
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: widget.isDarkMode
                                          ? Colors.white.withValues(alpha: 0.1)
                                          : Colors.black.withValues(alpha: 0.05),
                                      borderRadius: BorderRadius.circular(12),
                                      border: isHost
                                          ? Border.all(
                                              color: const Color(0xFFFF6B9D),
                                              width: 2,
                                            )
                                          : null,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: const Color(0xFFFF6B9D),
                                          child: Text(
                                            participant['display_name'][0].toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                participant['display_name'],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              if (isHost)
                                                Text(
                                                  'Host',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: const Color(0xFFFF6B9D),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: const Color(0xFF4CAF50),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Start button (only for host)
                  if (widget.isHost)
                    SizedBox(
                      width: double.infinity,
                      height: AppConstants.buttonHeight,
                      child: ElevatedButton(
                        onPressed: isLoading || participants.length < 2
                            ? null
                            : _proceedToTimerSelection,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B9D),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey,
                          disabledForegroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          isLoading 
                              ? 'Loading...'
                              : participants.length < 2
                                  ? 'Need at least 2 players (${participants.length}/2)'
                                  : 'Continue to Timer Setup',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: AppConstants.buttonHeight,
                      decoration: BoxDecoration(
                        color: widget.isDarkMode
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Waiting for host... (${participants.length} players)',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
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