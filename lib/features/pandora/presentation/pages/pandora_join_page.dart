// lib/features/pandora/presentation/pages/pandora_join_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/pandora_service.dart';
import '../../../../core/services/auth_service.dart';
import 'pandora_lobby_page.dart';
import '../../../../l10n/app_localizations.dart';

class PandoraJoinPage extends StatefulWidget {
  final bool isDarkMode;
  
  const PandoraJoinPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<PandoraJoinPage> createState() => _PandoraJoinPageState();
}

class _PandoraJoinPageState extends State<PandoraJoinPage> {
  final pandoraService = PandoraService();
  final authService = AuthService();
  final pinController = TextEditingController();
  final nameController = TextEditingController();
  bool isJoining = false;
  bool useConnectEmail = true;

  @override
  void initState() {
    super.initState();
    // Pre-fill with email if logged in
    if (authService.isLoggedIn) {
      nameController.text = authService.currentUser?.email ?? '';
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> _joinSession() async {
    final l10n = AppLocalizations.of(context)!;
    if (pinController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a 6-digit PIN')),
      );
      return;
    }

    final displayName = useConnectEmail && authService.isLoggedIn
        ? authService.currentUser!.email!
        : nameController.text.trim();

    if (displayName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pleaseEnterName)),
      );
      return;
    }

    setState(() => isJoining = true);

    try {
      final session = await pandoraService.joinSession(
        pin: pinController.text,
        displayName: displayName,
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PandoraLobbyPage(
              sessionId: session['id'],
              sessionPin: session['session_pin'],
              isHost: false,
              isDarkMode: widget.isDarkMode,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isJoining = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      l10n.joinPandoraGame,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // PIN input
                  Text(
                    l10n.sessionPin,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    ),
                    decoration: InputDecoration(
                      hintText: '000000',
                      counterText: '',
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
                  
                  const SizedBox(height: 30),
                  
                  // Name selection
                  Text(
                    l10n.yourDisplayName,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  if (authService.isLoggedIn) ...[
                    // Toggle for using email or custom name
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: widget.isDarkMode
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: useConnectEmail,
                            onChanged: (value) {
                              setState(() => useConnectEmail = value ?? true);
                            },
                            activeColor: const Color(0xFFFF6B9D),
                          ),
                          Expanded(
                            child: Text(
                              l10n.useMyConnectEmail(authService.currentUser?.email ?? ''),
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  
                  // Custom name input
                  if (!authService.isLoggedIn || !useConnectEmail)
                    TextField(
                      controller: nameController,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                      ),
                      decoration: InputDecoration(
                        hintText: l10n.enterYourName,
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
                  
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom > 0 ? 20 : 60), // DYNAMIC SPACING
                  
                  // Join button
                  SizedBox(
                    width: double.infinity,
                    height: AppConstants.buttonHeight,
                    child: ElevatedButton(
                      onPressed: isJoining ? null : _joinSession,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B9D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: isJoining
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              l10n.joinSession,
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
}