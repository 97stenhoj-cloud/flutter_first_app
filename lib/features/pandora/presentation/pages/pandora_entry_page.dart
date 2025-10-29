// lib/features/pandora/presentation/pages/pandora_entry_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import 'pandora_host_page.dart';
import 'pandora_join_page.dart';
import '../../../../l10n/app_localizations.dart';

class PandoraEntryPage extends StatelessWidget {
  final bool isDarkMode;
  
  const PandoraEntryPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pandoraColors = ThemeHelper.getGameModeGradient('pandora', isDarkMode);
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(isDarkMode),
        child: SafeArea(
          child: SingleChildScrollView(
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
                      color: ThemeHelper.getHeadingTextColor(isDarkMode),
                      size: 28,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Title with icon
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: pandoraColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: pandoraColors[0].withValues(alpha: 0.4),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.network(
                              'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/pandora.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.psychology,
                                  size: 70,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Pandora',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.getHeadingTextColor(isDarkMode),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Collaborative Question Game',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: ThemeHelper.getBodyTextColor(isDarkMode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Info card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: pandoraColors[0].withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: pandoraColors[0],
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'How it works',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : const Color(0xFF2D2D2D),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildInfoItem('1', l10n.pandoraHostCreatePin, pandoraColors[0]),
                        _buildInfoItem('2', l10n.pandoraPlayersJoinMax, pandoraColors[0]),
                        _buildInfoItem('3', l10n.pandoraHostSetsTimer, pandoraColors[0]),
                        _buildInfoItem('4', l10n.pandoraEveryoneSubmits, pandoraColors[0]),
                        _buildInfoItem('5', l10n.pandoraHostControls, pandoraColors[0]),
                        _buildInfoItem('⚠️', l10n.pandoraQuestionsDeleted, pandoraColors[0]),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Host button
                  SizedBox(
                    width: double.infinity,
                    height: AppConstants.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PandoraHostPage(isDarkMode: isDarkMode),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pandoraColors[0],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_circle_outline, size: 24),
                          const SizedBox(width: 12),
                          Text(
                            'Host a Session',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Join button
                  SizedBox(
                    width: double.infinity,
                    height: AppConstants.buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PandoraJoinPage(isDarkMode: isDarkMode),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: pandoraColors[0],
                        side: BorderSide(
                          color: pandoraColors[0],
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.login, size: 24),
                          const SizedBox(width: 12),
                          Text(
                            'Join a Session',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String number, String text, Color accentColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white : const Color(0xFF2D2D2D),
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}