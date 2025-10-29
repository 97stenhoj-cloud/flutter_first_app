// lib/features/auth/presentation/pages/social_auth_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;
import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../l10n/app_localizations.dart';

class SocialAuthPage extends StatefulWidget {
  final bool isDarkMode;
  
  const SocialAuthPage({super.key, required this.isDarkMode});

  @override
  State<SocialAuthPage> createState() => _SocialAuthPageState();
}

class _SocialAuthPageState extends State<SocialAuthPage> {
  final authService = AuthService();
  final unlockManager = UnlockManager();
  
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleGoogleSignIn() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await authService.signInWithGoogle();
      await unlockManager.initialize();

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      setState(() {
        _errorMessage = l10n.googleSignInFailed;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handleAppleSignIn() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await authService.signInWithApple();
      await unlockManager.initialize();

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      setState(() {
        _errorMessage = l10n.appleSignInFailed;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildSocialButton({    
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
    required Widget icon,
  }) {
    return ElevatedButton(
      onPressed: _isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                      size: 28,
                    ),
                  ),
                ),
              ),
              
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // App Icon from Supabase storage
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/AppIcon/AppIcon.png',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.1),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.chat_bubble_rounded,
                                    size: 60,
                                    color: widget.isDarkMode 
                                        ? const Color(0xFF8D6E63)
                                        : const Color(0xFF6D4C41),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        
                        Text(
                          l10n.welcomeToConnect,
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        
                        Text(
                          l10n.signInToSync,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 48),
                        
                        if (Platform.isIOS || Platform.isMacOS) ...[
                          _buildSocialButton(
                            text: l10n.continueWithApple,
                            onPressed: _handleAppleSignIn,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            icon: const Icon(Icons.apple, size: 24),
                          ),
                          const SizedBox(height: 16),
                        ],
                        
                        _buildSocialButton(
                          text: l10n.continueWithGoogle,
                          onPressed: _handleGoogleSignIn,
                          backgroundColor: Colors.white,
                          textColor: Colors.black87,
                          icon: Image.asset(
                            'assets/images/google_logo.png',
                            height: 24,
                            width: 24,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.g_mobiledata, size: 32, color: Colors.red);
                            },
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        if (_errorMessage != null)
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.red.shade300),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red.shade900),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.red.shade900,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                        if (_isLoading)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: CircularProgressIndicator(),
                          ),
                        
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            l10n.skipForNow,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            l10n.byContining,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}