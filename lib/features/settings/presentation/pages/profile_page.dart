// lib/features/settings/presentation/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/pages/social_auth_page.dart';
import '../../../subscription/presentation/pages/subscription_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/widgets/custom_dialog.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const ProfilePage({super.key, required this.isDarkMode});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final authService = AuthService();

  Widget _buildFullWidthButton({
    required String text,
    required VoidCallback onPressed,
    required bool isPrimary,
    IconData? icon,
  }) {
    final colors = isPrimary
        ? ThemeHelper.getPrimaryButtonGradient(widget.isDarkMode).colors
        : ThemeHelper.getSecondaryButtonGradient(widget.isDarkMode).colors;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outermost layer
        Container(
          width: double.infinity,
          height: AppConstants.buttonHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors[0], colors[1]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: widget.isDarkMode
                    ? const Color.fromRGBO(0, 0, 0, 0.4)
                    : const Color.fromRGBO(100, 80, 60, 0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        // Middle layer
        Positioned.fill(
          left: 4,
          right: 4,
          top: 4,
          bottom: 4,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors[0].withValues(alpha: 0.85),
                  colors[1].withValues(alpha: 0.85)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        // Innermost layer (button)
        Positioned.fill(
          left: 8,
          right: 8,
          top: 8,
          bottom: 8,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            size: 24,
                            color: isPrimary
                                ? Colors.white
                                : ThemeHelper.getSecondaryButtonTextColor(
                                    widget.isDarkMode),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              text,
                              style: GoogleFonts.poppins(
                                fontSize: isPrimary ? 18 : 16,
                                fontWeight: isPrimary
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                                color: isPrimary
                                    ? Colors.white
                                    : ThemeHelper.getSecondaryButtonTextColor(
                                        widget.isDarkMode),
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          text,
                          style: GoogleFonts.poppins(
                            fontSize: isPrimary ? 18 : 16,
                            fontWeight:
                                isPrimary ? FontWeight.bold : FontWeight.w600,
                            color: isPrimary
                                ? Colors.white
                                : ThemeHelper.getSecondaryButtonTextColor(
                                    widget.isDarkMode),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _unsubscribe() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    try {
      // Update the user's subscription status in Supabase
      await Supabase.instance.client
          .from('user_subscriptions')
          .update({
            'is_premium': false,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('user_id', user.id);
      
      // Update UnlockManager state
      ref.read(unlockProvider.notifier).lockPremium();
      
      debugPrint('✅ Successfully unsubscribed user');
    } catch (e) {
      debugPrint('❌ Error unsubscribing: $e');
      rethrow;
    }
  }

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
                                title: l10n.email,
                                value: user.email!,
                                iconColor: const Color(0xFF4285F4),
                              ),
                              _buildInfoCard(
                                icon: Icons.person,
                                title: l10n.userId,
                                value: '${user.id.substring(0, 8)}...',
                                iconColor: const Color(0xFF34A853),
                              ),

                              const SizedBox(height: 32),

                              // Subscription Status
                              Text(
                                l10n.subscription,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Check if user has premium
                              if (!ref.watch(unlockProvider).isPremium) ...[
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
                                          l10n.noActiveSubscription,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Get Premium Button
                                _buildFullWidthButton(
                                  text: l10n.getPremium,
                                  icon: Icons.workspace_premium,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
                                      ),
                                    ).then((_) {
                                      if (mounted) {
                                        setState(() {}); // Refresh after returning
                                      }
                                    });
                                  },
                                  isPrimary: true,
                                ),
                              ] else
                                Column(
                                  children: [
                                    // Premium Status Button - Full Width Golden
                                    SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 18),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFFFD700), // Gold
                                              Color(0xFFD4A574), // Dark Gold
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFFFFD700).withValues(alpha: 0.4),
                                              blurRadius: 15,
                                              offset: const Offset(0, 6),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.workspace_premium,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              l10n.premium,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),

                                    // Unsubscribe Button - Full Width
                                    _buildFullWidthButton(
                                      text: l10n.unsubscribe,
                                      icon: Icons.cancel_outlined,
                                      isPrimary: false,
                                      onPressed: () async {
                                            final confirmed = await showDialog<bool>(
                                              context: context,
                                              builder: (context) => CustomDialog(
                                                isDarkMode: widget.isDarkMode,
                                                icon: Icons.warning_amber_rounded,
                                                iconColor: Colors.orange,
                                                title: l10n.unsubscribeConfirm,
                                                content: l10n.unsubscribeWarning,
                                                actions: [
                                                  DialogButton(
                                                    text: l10n.cancel,
                                                    onPressed: () => Navigator.pop(context, false),
                                                    isPrimary: false,
                                                    isDarkMode: widget.isDarkMode,
                                                  ),
                                                  const SizedBox(height: 12),
                                                  DialogButton(
                                                    text: l10n.yesUnsubscribe,
                                                    onPressed: () => Navigator.pop(context, true),
                                                    isPrimary: true,
                                                    isDarkMode: widget.isDarkMode,
                                                    customColor: Colors.red,
                                                    icon: Icons.cancel,
                                                  ),
                                                ],
                                              ),
                                            );

                                            if (confirmed == true) {
                                              if (!mounted) return;

                                              try {
                                                await _unsubscribe();

                                                if (!mounted) return;

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      l10n.unsubscribeSuccess,
                                                      style: GoogleFonts.poppins(),
                                                    ),
                                                    backgroundColor: Colors.green,
                                                  ),
                                                );

                                                setState(() {});
                                              } catch (e) {
                                                if (!mounted) return;

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      '${l10n.unsubscribeError}: $e',
                                                      style: GoogleFonts.poppins(),
                                                    ),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                    ),
                                  ],
                                ),

                              const SizedBox(height: 40),

                              // Sign Out Button - Full Width
                              _buildFullWidthButton(
                                text: l10n.signOut,
                                icon: Icons.logout,
                                onPressed: () async {
                                      final confirmed = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => CustomDialog(
                                          isDarkMode: widget.isDarkMode,
                                          icon: Icons.logout,
                                          iconColor: Colors.orange,
                                          iconSize: 48,
                                          title: l10n.signOut,
                                          content: l10n.signOutConfirm,
                                          actions: [
                                            DialogButton(
                                              text: l10n.cancel,
                                              onPressed: () => Navigator.pop(context, false),
                                              isPrimary: false,
                                              isDarkMode: widget.isDarkMode,
                                            ),
                                            const SizedBox(height: 12),
                                            DialogButton(
                                              text: l10n.signOut,
                                              onPressed: () => Navigator.pop(context, true),
                                              isPrimary: true,
                                              isDarkMode: widget.isDarkMode,
                                              customColor: Colors.red,
                                              icon: Icons.logout,
                                            ),
                                          ],
                                        ),
                                      );

                                      if (confirmed == true) {
                                        await authService.signOut();
                                        if (mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                l10n.signedOutSuccess,
                                                style: GoogleFonts.poppins(),
                                              ),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                          setState(() {});
                                        }
                                      }
                                    },
                                    isPrimary: false,
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

                              // Sign In Button
                              _buildFullWidthButton(
                                text: l10n.signInSignUp,
                                icon: Icons.login,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SocialAuthPage(isDarkMode: widget.isDarkMode),
                                    ),
                                  ).then((_) {
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  });
                                },
                                isPrimary: true,
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