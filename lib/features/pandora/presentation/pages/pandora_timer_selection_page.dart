// lib/features/pandora/presentation/pages/pandora_timer_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import 'pandora_question_submission_page.dart';

class PandoraTimerSelectionPage extends StatefulWidget {
  final String sessionId;
  final bool isDarkMode;
  
  const PandoraTimerSelectionPage({
    super.key,
    required this.sessionId,
    required this.isDarkMode,
  });

  @override
  State<PandoraTimerSelectionPage> createState() => _PandoraTimerSelectionPageState();
}

class _PandoraTimerSelectionPageState extends State<PandoraTimerSelectionPage> {
  final pandoraService = PandoraService();
  int selectedMinutes = 5;
  bool isStarting = false;
  
  Timer? timeoutTimer;
  late DateTime timeoutEndTime;
  Duration remainingTimeout = const Duration(minutes: 5);

  @override
  void initState() {
    super.initState();
    timeoutEndTime = DateTime.now().add(const Duration(minutes: 5));
    _startTimeoutTimer();
  }

  @override
  void dispose() {
    timeoutTimer?.cancel();
    super.dispose();
  }
  
  void _startTimeoutTimer() {
    timeoutTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTimeout = timeoutEndTime.difference(DateTime.now());
        
        if (remainingTimeout.isNegative) {
          remainingTimeout = Duration.zero;
          timer.cancel();
          if (mounted) {
            _endSession();
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
  
  Future<void> _endSession() async {
    try {
      await pandoraService.endSession(widget.sessionId);
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Session timed out - host did not set timer'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error ending session: $e');
    }
  }

  Future<void> _startQuestionCollection() async {
    setState(() => isStarting = true);

    try {
      // Update session status to collecting_questions AND save timer_minutes
      await pandoraService.startQuestionCollection(widget.sessionId, selectedMinutes);
      
      // Small delay to ensure all clients get the status update
      await Future.delayed(const Duration(milliseconds: 500));
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PandoraQuestionSubmissionPage(
              sessionId: widget.sessionId,
              isHost: true,
              timerMinutes: selectedMinutes,
              isDarkMode: widget.isDarkMode,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error starting: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isStarting = false);
      }
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: remainingTimeout.inMinutes < 2
                            ? Colors.red.withValues(alpha: 0.2)
                            : Colors.orange.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: remainingTimeout.inMinutes < 2
                              ? Colors.red
                              : Colors.orange,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: remainingTimeout.inMinutes < 2
                                ? Colors.red
                                : Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formatTime(remainingTimeout),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: remainingTimeout.inMinutes < 2
                                  ? Colors.red
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Title
                Center(
                  child: Text(
                    '⏱️ Set Question Timer',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // Timer selection
                Text(
                  'Question Collection Time',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Timer slider
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode 
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$selectedMinutes minutes',
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Slider(
                        value: selectedMinutes.toDouble(),
                        min: 1,
                        max: 15,
                        divisions: 14,
                        label: '$selectedMinutes min',
                        activeColor: const Color(0xFFFF6B9D),
                        onChanged: (value) {
                          setState(() {
                            selectedMinutes = value.round();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Warning about timeout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.orange.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Session will end automatically if you don\'t continue within 5 minutes',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Start button
                SizedBox(
                  width: double.infinity,
                  height: AppConstants.buttonHeight,
                  child: ElevatedButton(
                    onPressed: isStarting ? null : _startQuestionCollection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B9D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: isStarting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Start Question Collection',
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