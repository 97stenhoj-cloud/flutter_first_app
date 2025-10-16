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
  final nameController = TextEditingController();
  bool isCreating = false;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _createSession() async {
    final displayName = nameController.text.trim();
    
    if (displayName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }
    
    setState(() => isCreating = true);

    try {
      // Add "(Host)" suffix to display name
      final hostDisplayName = '$displayName (Host)';
      
      final session = await pandoraService.createSession(
        timerMinutes: 5,
        hostDisplayName: hostDisplayName,
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
                              color: ThemeHelper.getTextColor(widget.isDarkMode),
                              size: 32,
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Title
                          Text(
                            '🔮 Host Pandora Session',
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Name input
                          Text(
                            'Your Display Name',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeHelper.getTextColor(widget.isDarkMode),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              hintStyle: GoogleFonts.poppins(
                                color: widget.isDarkMode 
                                    ? Colors.white.withValues(alpha: 0.5)
                                    : Colors.grey,
                              ),
                              filled: true,
                              fillColor: widget.isDarkMode 
                                  ? Colors.white.withValues(alpha: 0.1)
                                  : Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixText: '(Host)',
                              suffixStyle: GoogleFonts.poppins(
                                color: const Color(0xFFFF6B9D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              color: widget.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Info card
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.05)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFF6B9D),
                                        borderRadius: BorderRadius.circular(8),
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
                                _buildInfoItem('2', 'Players join with their names'),
                                _buildInfoItem('3', 'Host sets question timer (1-15 min)'),
                                _buildInfoItem('4', 'Everyone submits questions (min 5)'),
                                _buildInfoItem('5', 'Host controls game progression'),
                                _buildInfoItem('⚠️', 'Questions deleted after game'),
                              ],
                            ),
                          ),
                          
                          const Spacer(),
                          
                          // Create button
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