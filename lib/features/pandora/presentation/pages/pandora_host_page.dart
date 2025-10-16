// lib/features/pandora/presentation/pages/pandora_host_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import 'pandora_lobby_page.dart';

class PandoraHostPage extends StatefulWidget {
  final bool isDarkMode;
  
  const PandoraHostPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<PandoraHostPage> createState() => _PandoraHostPageState();
}

class _PandoraHostPageState extends State<PandoraHostPage> {
  final pandoraService = PandoraService();
  bool isCreating = false;

  Future<void> _createSession() async {
    setState(() => isCreating = true);

    try {
      final session = await pandoraService.createSession(
        timerMinutes: 5,  // Default value, will be set later
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PandoraLobbyPage(
              sessionId: session['id'],
              sessionPin: session['session_pin'],
              isHost: true,
              isDarkMode: widget.isDarkMode,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating session: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isCreating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back button
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                              size: 28,
                            ),
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Title
                          Center(
                            child: Text(
                              '🔮 Host Pandora Session',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          
                          const SizedBox(height: 60),
                          
                          // Info card
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.1)
                                  : Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Color(0xFFFF6B9D), Color(0xFFFF8E53)],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        'How it works',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _buildInfoItem('1', 'Host creates session and shares PIN'),
                                _buildInfoItem('2', 'Players join (max 15 min)'),
                                _buildInfoItem('3', 'Host sets question timer (1-15 min)'),
                                _buildInfoItem('4', 'Everyone submits questions (min 5)'),
                                _buildInfoItem('5', 'Host controls game progression'),
                                _buildInfoItem('⚠️', 'Questions deleted after game'),
                              ],
                            ),
                          ),
                          
                          const Spacer(),
                          
                          // Host button
                          SizedBox(
                            width: double.infinity,
                            height: AppConstants.buttonHeight,
                            child: ElevatedButton(
                              onPressed: isCreating ? null : _createSession,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF6B9D),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                              ),
                              child: isCreating
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : Text(
                                      'Create Session',
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
            },
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoItem(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B9D),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: widget.isDarkMode ? Colors.white : const Color(0xFF2D2D2D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}