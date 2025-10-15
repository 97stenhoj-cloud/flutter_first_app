// lib/features/pandora/presentation/pages/pandora_waiting_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import 'pandora_question_submission_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PandoraWaitingPage extends StatefulWidget {
  final String sessionId;
  final bool isDarkMode;
  
  const PandoraWaitingPage({
    super.key,
    required this.sessionId,
    required this.isDarkMode,
  });

  @override
  State<PandoraWaitingPage> createState() => _PandoraWaitingPageState();
}

class _PandoraWaitingPageState extends State<PandoraWaitingPage> {
  final pandoraService = PandoraService();
  RealtimeChannel? sessionChannel;
  int? timerMinutes;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _subscribeToSession();
    _checkCurrentStatus();
  }

  @override
  void dispose() {
    sessionChannel?.unsubscribe();
    super.dispose();
  }

  Future<void> _checkCurrentStatus() async {
    try {
      final session = await pandoraService.getSession(widget.sessionId);
      if (session != null && mounted && !_hasNavigated) {
        _handleStatusChange(session);
      }
    } catch (e) {
      debugPrint('Error checking status: $e');
    }
  }

  void _subscribeToSession() {
    sessionChannel = pandoraService.subscribeToSession(
      widget.sessionId,
      (session) {
        debugPrint('📡 [Waiting] Status changed: ${session['status']}');
        if (mounted && !_hasNavigated) {
          _handleStatusChange(session);
        }
      },
    );
  }

  void _handleStatusChange(Map<String, dynamic> session) {
    if (_hasNavigated) return;
    
    final status = session['status'];
    debugPrint('🔄 [Waiting] Handling status: $status');
    
    if (status == 'collecting_questions') {
      _hasNavigated = true;
      timerMinutes = session['timer_minutes'] as int?;
      
      debugPrint('✅ [Waiting] Navigating to question submission with timer: $timerMinutes');
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PandoraQuestionSubmissionPage(
            sessionId: widget.sessionId,
            isHost: false,
            timerMinutes: timerMinutes ?? 5,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );
    }
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated icon
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.8 + (value * 0.2),
                      child: Icon(
                        Icons.hourglass_empty,
                        size: 100,
                        color: const Color(0xFFFF6B9D).withValues(alpha: value),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 40),
                
                // Title
                Text(
                  'Waiting for Host',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Description
                Text(
                  'The host will start the question submission phase soon. Get ready to submit your questions!',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 60),
                
                // Info card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFFFF6B9D),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Once the host starts, you\'ll be able to submit questions.',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: widget.isDarkMode ? Colors.white : const Color(0xFF2D2D2D),
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