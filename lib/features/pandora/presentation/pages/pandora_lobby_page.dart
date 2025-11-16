// lib/features/pandora/presentation/pages/pandora_lobby_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import 'pandora_timer_selection_page.dart';
import 'pandora_question_submission_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../subscription/presentation/pages/subscription_page.dart';

class PandoraLobbyPage extends ConsumerStatefulWidget {
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
  ConsumerState<PandoraLobbyPage> createState() => _PandoraLobbyPageState();
}

class _PandoraLobbyPageState extends ConsumerState<PandoraLobbyPage> {
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
      
      // For non-hosts, check if kicked BEFORE loading participants
      if (!widget.isHost) {
        _checkIfKicked();
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
Future<void> _checkIfKicked() async {
    try {
      final userEmail = Supabase.instance.client.auth.currentUser?.email;
      debugPrint('📧 [Polling] Checking with email: $userEmail');
      
      final currentParticipants = await pandoraService.getParticipants(widget.sessionId);
      debugPrint('📋 [Polling] Current participants count: ${currentParticipants.length}');
      
      // Check if I'm still in the session
      final myParticipant = currentParticipants.firstWhere(
        (p) => p['user_email'] == userEmail,
        orElse: () => <String, dynamic>{},
      );
      
      final stillInSession = myParticipant.isNotEmpty;
      debugPrint('✅ [Polling] Still in session: $stillInSession');
      
      if (!stillInSession && mounted) {
        debugPrint('🚫🚫🚫 [Polling] Player was KICKED - leaving lobby NOW!');
        
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.youWereKicked),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
        
        // Navigate back to home
        await Future.delayed(const Duration(milliseconds: 100));
        if (mounted) {
          debugPrint('🚪 [Polling] Navigating to home...');
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      }
    } catch (e) {
      debugPrint('❌ [Polling] Error checking if kicked: $e');
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
    debugPrint('🔌 [Lobby] Setting up real-time subscriptions for session: ${widget.sessionId}');
    debugPrint('🔌 [Lobby] isHost: ${widget.isHost}');
    
    // Subscribe to participants changes
    debugPrint('🔌 [Lobby] Creating participants subscription...');
    participantsChannel = pandoraService.subscribeToParticipants(
      widget.sessionId,
      () async {
        debugPrint('🔥🔥🔥 [Lobby] PARTICIPANTS CALLBACK FIRED! 🔥🔥🔥');
        debugPrint('👥 [Lobby] Participants changed - checking for kicks');
        debugPrint('👤 [Lobby] isHost: ${widget.isHost}');
        
        // Check if current user was kicked (only for non-hosts)
        if (!widget.isHost) {
          debugPrint('🔍 [Lobby] Non-host detected - checking if kicked');
          final userEmail = Supabase.instance.client.auth.currentUser?.email;
          debugPrint('📧 [Lobby] User email: $userEmail');
          
          final newParticipants = await pandoraService.getParticipants(widget.sessionId);
          debugPrint('📋 [Lobby] Fetched ${newParticipants.length} participants from DB');
          
          // Find current user's participant
          final myParticipant = newParticipants.firstWhere(
            (p) => p['user_email'] == userEmail,
            orElse: () => <String, dynamic>{},
          );
          
          final stillInSession = myParticipant.isNotEmpty;
          
          debugPrint('🔍 Email: $userEmail, Still in session: $stillInSession');
          debugPrint('🔍 Current participants: ${newParticipants.map((p) => "${p["display_name"]} (${p["user_email"]})").join(", ")}');
          
          if (!stillInSession && mounted) {
            debugPrint('🚫🚫🚫 Player was KICKED - leaving lobby NOW!');
            
            // Immediately show message and leave
            final l10n = AppLocalizations.of(context)!;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.youWereKicked),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
            
            // Navigate back immediately
            await Future.delayed(const Duration(milliseconds: 100));
            if (mounted) {
              debugPrint('🚪 [Lobby] Navigating back to home...');
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
            return;
          } else {
            debugPrint('✅ [Lobby] Player still in session - continuing normally');
          }
        } else {
          debugPrint('👑 [Lobby] Host detected - skipping kick check');
        }
        
        await _loadParticipants();
        
        // Check player limit for freemium hosts
        if (widget.isHost && !ref.read(unlockProvider).isPremium && participants.length > 6) {
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.freemiumPlayerLimit),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
    );
    debugPrint('✅ [Lobby] Participants subscription created');

    // Subscribe to session status changes
    debugPrint('🔌 [Lobby] Creating session subscription...');
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
    debugPrint('✅ [Lobby] Session subscription created');
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
    final l10n = AppLocalizations.of(context)!;
    Clipboard.setData(ClipboardData(text: widget.sessionPin));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.pinCopied),
        duration: Duration(seconds: 2),
      ),
    );
  }
  Future<void> _kickParticipant(String participantId, String displayName) async {
  final l10n = AppLocalizations.of(context)!;
  
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.kickPlayer, style: GoogleFonts.poppins()),
      content: Text(
        l10n.kickPlayerConfirm(displayName),
        style: GoogleFonts.poppins(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.cancel, style: GoogleFonts.poppins()),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text(l10n.kick, style: GoogleFonts.poppins()),
        ),
      ],
    ),
  );

  if (confirmed == true && mounted) {
    try {
      debugPrint('🚨 Attempting to kick participant: $participantId');
      
      // Temporarily unsubscribe to force refresh
      await participantsChannel?.unsubscribe();
      
      // Kick the participant
      await pandoraService.kickParticipant(participantId);
      debugPrint('✅ Kick request sent');
      
      // Wait a moment for database to update
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Force reload
      await _loadParticipants();
      debugPrint('🔄 Participants reloaded after kick');
      
      // Resubscribe to changes
      _subscribeToChanges();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.playerKicked(displayName)),
          ),
        );
      }
    } catch (e) {
      debugPrint('❌ Error kicking participant: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.failedToKickPlayer}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PopScope(
      canPop: !widget.isHost,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        
        // Confirm exit for host
        if (widget.isHost) {
          final shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(l10n.endSession),
              content: Text(l10n.endSessionConfirm),
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
                        '${l10n.joinTime}: ${_formatTime(remainingTime)}',
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
                        l10n.sessionPin,
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
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                widget.sessionPin,
                                style: GoogleFonts.poppins(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 8,
                                ),
                              ),
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
                    '${l10n.participants} (${participants.length})',
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
                                                  l10n.pandoraHost,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: const Color(0xFFFF6B9D),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        // Kick button (only show for host, and not for themselves)
      if (widget.isHost && !isHost)
        IconButton(
          onPressed: () => _kickParticipant(
            participant['id'],
            participant['display_name'],
          ),
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
            size: 24,
          ),
          tooltip: l10n.kickPlayer,
        )
      else
        const Icon(
          Icons.check_circle,
          color: Color(0xFF4CAF50),
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
  // Check if over player limit
  !ref.read(unlockProvider).isPremium && participants.length > 6
    ? SizedBox(
        width: double.infinity,
        height: AppConstants.buttonHeight,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4A574),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_open, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.upgradeForUnlimitedPlayers,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      )
    : SizedBox(
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
              ? l10n.loading
              : participants.length < 2
                ? l10n.needAtLeastPlayers(participants.length)
                : l10n.continueToTimerSetup,
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
      l10n.waitingForHost(participants.length),
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