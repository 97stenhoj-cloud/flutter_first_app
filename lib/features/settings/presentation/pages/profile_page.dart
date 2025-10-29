// lib/features/settings/presentation/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/pages/social_auth_page.dart';  // ADD THIS IMPORT

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  
  const ProfilePage({super.key, required this.isDarkMode});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authService = AuthService();
  final unlockManager = UnlockManager();
  
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    Color? iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (iconColor ?? Colors.white).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(String bundleName) {
    final Map<String, Color> bundleColors = {
      'Couple': const Color(0xFFAD1457),
      'Friends': const Color(0xFFFF8F00),
      'Family': const Color(0xFF8D6E63),
    };

    final color = bundleColors[bundleName] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            bundleName,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = authService.currentUser;
    final isSignedIn = user != null;

    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      l10n.profile,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Content
                Expanded(
                  child: isSignedIn
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Avatar
                              Center(
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: ThemeHelper.getPrimaryButtonGradient(widget.isDarkMode).colors,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: ThemeHelper.getButtonShadow(widget.isDarkMode),
                                  ),
                                  child: Center(
                                    child: Text(
                                      user.email![0].toUpperCase(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // User Info
                              _buildInfoCard(
                                icon: Icons.email,
                                title: 'Email',
                                value: user.email!,
                                iconColor: const Color(0xFF4285F4),
                              ),
                              _buildInfoCard(
                                icon: Icons.person,
                                title: 'User ID',
                                value: '${user.id.substring(0, 8)}...',
                                iconColor: const Color(0xFF34A853),
                              ),

                              const SizedBox(height: 32),

                              // Subscription Status
                              Text(
                                'Subscription',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Check if user has any unlocked bundles
                              if (!unlockManager.isPremium)
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.info_outline, color: Colors.white70),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'No Active Subscription',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              else
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    if (unlockManager.isPremium)
                                      _buildSubscriptionCard('Premium')
                                  ],
                                ),

                              const SizedBox(height: 40),

                              // Sign Out Button
                              ThemeHelper.buildLayeredButton(
                                text: l10n.signOut,
                                icon: Icons.logout,
                                onPressed: () async {
                                  final confirmed = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(l10n.signOut),
                                      content: Text(l10n.signOutConfirm),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, false),
                                          child: Text(l10n.cancel),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, true),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.red,
                                          ),
                                          child: Text(l10n.signOut),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirmed == true) {
                                    await authService.signOut();
                                    setState(() {});
                                  }
                                },
                                isPrimary: false,
                                isDarkMode: widget.isDarkMode,
                              ),
                              
                              const SizedBox(height: 40),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_outline,
                                size: 100,
                                color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                l10n.notSignedIn,
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  l10n.signInToSync,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 40),
                              
                              // Sign In Button - NAVIGATE TO SOCIAL AUTH PAGE
                              ThemeHelper.buildLayeredButton(
                                text: l10n.signInSignUp,
                                icon: Icons.login,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SocialAuthPage(isDarkMode: widget.isDarkMode),
                                    ),
                                  ).then((_) {
                                    setState(() {});  // Refresh the page when coming back
                                  });
                                },
                                isPrimary: true,
                                isDarkMode: widget.isDarkMode,
                              ),
                            ],
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