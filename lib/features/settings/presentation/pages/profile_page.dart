// lib/features/settings/presentation/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/pages/social_auth_page.dart';
import '../../../subscription/presentation/pages/subscription_page_new.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/ad_banner_widget.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const ProfilePage({super.key, required this.isDarkMode});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final authService = AuthService();
  final supabaseService = SupabaseService();
  bool _isCaching = false;

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

  Future<void> _preCacheContent() async {
    if (_isCaching) return;

    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _isCaching = true;
    });

    try {
      final languageCode = ref.read(localeProvider).currentLocale.languageCode;
      await supabaseService.preCacheAllContent(languageCode: languageCode);

      if (!mounted) return;

      // Refresh UI to show updated downloaded languages
      setState(() {});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.downloadCompleteMessage,
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      debugPrint('❌ Error pre-caching: $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to cache content. Please check your internet connection.',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isCaching = false;
        });
      }
    }
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
            'subscription_tier': null,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('user_id', user.id);

      // Clear all cached content (premium feature only)
      await supabaseService.clearCache();

      // Update UnlockManager state
      await ref.read(unlockProvider.notifier).lockPremium();

      debugPrint('✅ Successfully unsubscribed user and cleared cache');
    } catch (e) {
      debugPrint('❌ Error unsubscribing: $e');
      rethrow;
    }
  }

  Widget _buildSectionDivider(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    ThemeHelper.getMutedTextColor(widget.isDarkMode).withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeHelper.getMutedTextColor(widget.isDarkMode).withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientCard({
    required Widget child,
    List<Color>? gradientColors,
  }) {
    final defaultColors = [
      widget.isDarkMode
          ? const Color(0xFF2A2A3E)
          : const Color(0xFFF5E6F1),
      widget.isDarkMode
          ? const Color(0xFF1F1F2E)
          : const Color(0xFFE8D4E8),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors ?? defaultColors,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: (gradientColors?[0] ?? defaultColors[0]).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildBenefitItem(String text, {bool isPremium = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 18,
            color: isPremium ? const Color(0xFF4CAF50) : ThemeHelper.getMutedTextColor(widget.isDarkMode),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                fontWeight: FontWeight.w500,
              ),
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
                              // Simple Profile Header - Centered
                              Center(
                                child: Column(
                                  children: [
                                    // Name (if available from metadata)
                                    if (user.userMetadata?['full_name'] != null ||
                                        user.userMetadata?['name'] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          user.userMetadata?['full_name']?.toString() ??
                                          user.userMetadata?['name']?.toString() ?? '',
                                          style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    // Email
                                    Text(
                                      user.email!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    // User ID
                                    Text(
                                      'ID: ${user.id.substring(0, 8)}...',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                              _buildSectionDivider('SUBSCRIPTION'),

                              // Check if user has premium
                              if (!ref.watch(unlockProvider).isPremium) ...[
                                _buildGradientCard(
                                  gradientColors: [
                                    const Color(0xFFF5E6F1),
                                    const Color(0xFFFFDEEB),
                                  ],
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      children: [
                                        // No subscription icon
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange.withValues(alpha: 0.2),
                                          ),
                                          child: Icon(
                                            Icons.workspace_premium,
                                            size: 48,
                                            color: Colors.orange[700],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          l10n.noActiveSubscription,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF2D2D3A),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Unlock AI-powered questions, offline mode, and more',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: const Color(0xFF6B6B7B),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 24),
                                        // Get Premium Button
                                        _buildFullWidthButton(
                                          text: l10n.getPremium,
                                          icon: Icons.workspace_premium,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => SubscriptionPageNew(isDarkMode: widget.isDarkMode),
                                              ),
                                            ).then((_) {
                                              if (mounted) {
                                                setState(() {}); // Refresh after returning
                                              }
                                            });
                                          },
                                          isPrimary: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ] else
                                Column(
                                  children: [
                                    // Premium Subscription Card
                                    Builder(
                                      builder: (context) {
                                        final tier = ref.watch(unlockProvider).subscriptionTier;
                                        final unlockState = ref.watch(unlockProvider);

                                        // Get colors and text based on tier
                                        List<Color> gradientColors;
                                        String tierText;
                                        IconData tierIcon;
                                        List<String> benefits;

                                        switch (tier) {
                                          case SubscriptionTier.basic:
                                            gradientColors = [const Color(0xFF9E9E9E), const Color(0xFF757575)];
                                            tierText = 'Basic';
                                            tierIcon = Icons.workspace_premium;
                                            benefits = [
                                              'Access to premium content',
                                              'Ad-free experience',
                                              'Priority support',
                                            ];
                                            break;
                                          case SubscriptionTier.premium:
                                            gradientColors = [const Color(0xFFD4A574), const Color(0xFFB8956A)];
                                            tierText = 'Premium';
                                            tierIcon = Icons.workspace_premium;
                                            benefits = [
                                              'Everything in Basic',
                                              'AI Question Generation (150/month)',
                                              'Offline mode',
                                              'Custom decks',
                                            ];
                                            break;
                                          case SubscriptionTier.premiumPlus:
                                            gradientColors = [const Color(0xFF9C27B0), const Color(0xFF673AB7)];
                                            tierText = 'Premium+';
                                            tierIcon = Icons.workspace_premium;
                                            benefits = [
                                              'Everything in Premium',
                                              'AI Question Generation (400/month)',
                                              'Advanced customization',
                                              'Early access to features',
                                            ];
                                            break;
                                          default:
                                            gradientColors = [const Color(0xFFFFD700), const Color(0xFFD4A574)];
                                            tierText = l10n.premium;
                                            tierIcon = Icons.workspace_premium;
                                            benefits = ['Premium features unlocked'];
                                        }

                                        return _buildGradientCard(
                                          gradientColors: [
                                            gradientColors[0].withValues(alpha: 0.3),
                                            gradientColors[1].withValues(alpha: 0.2),
                                          ],
                                          child: Padding(
                                            padding: const EdgeInsets.all(24),
                                            child: Column(
                                              children: [
                                                // Tier Badge
                                                Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      colors: gradientColors,
                                                    ),
                                                    borderRadius: BorderRadius.circular(16),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: gradientColors[0].withValues(alpha: 0.4),
                                                        blurRadius: 15,
                                                        offset: const Offset(0, 6),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        tierIcon,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Text(
                                                        tierText,
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 24),
                                                // Benefits List
                                                ...benefits.map((benefit) => _buildBenefitItem(benefit)),
                                                // Spark Usage (for Premium and Premium+)
                                                if (tier == SubscriptionTier.premium || tier == SubscriptionTier.premiumPlus) ...[
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    padding: const EdgeInsets.all(16),
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFFF6B9D).withValues(alpha: 0.2),
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: Border.all(
                                                        color: const Color(0xFFFF6B9D).withValues(alpha: 0.5),
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.auto_awesome,
                                                          color: Color(0xFFD81B60),
                                                          size: 24,
                                                        ),
                                                        const SizedBox(width: 12),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'Spark Questions',
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: const Color(0xFF2D2D3A),
                                                                ),
                                                              ),
                                                              const SizedBox(height: 4),
                                                              Text(
                                                                '${unlockState.sparkQuestionsRemaining} of ${ref.read(unlockProvider.notifier).getSparkLimit()} remaining',
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  color: const Color(0xFF6B6B7B),
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 16),

                                    // Upgrade Button (only show for Basic and Premium users, not Premium+)
                                    if (ref.watch(unlockProvider).subscriptionTier != SubscriptionTier.premiumPlus)
                                      Column(
                                        children: [
                                          _buildFullWidthButton(
                                            text: 'Upgrade Subscription',
                                            icon: Icons.arrow_upward,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => SubscriptionPageNew(isDarkMode: widget.isDarkMode),
                                                ),
                                              ).then((_) {
                                                if (mounted) {
                                                  setState(() {}); // Refresh after returning
                                                }
                                              });
                                            },
                                            isPrimary: true,
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),

                                    _buildSectionDivider('TRAVEL FEATURE'),

                                    // Travel Feature Card
                                    _buildGradientCard(
                                      gradientColors: [
                                        const Color(0xFFE8F5E9),
                                        const Color(0xFFC8E6C9),
                                      ],
                                      child: Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Offline Mode Section
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Icon(
                                                    Icons.offline_bolt,
                                                    color: Colors.green[800],
                                                    size: 24,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    'Offline Mode',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: const Color(0xFF2D2D3A),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            // Download Button
                                            _buildFullWidthButton(
                                              text: _isCaching
                                                  ? l10n.downloading
                                                  : l10n.downloadForOffline,
                                              icon: _isCaching
                                                  ? Icons.downloading
                                                  : Icons.download_for_offline,
                                              isPrimary: false,
                                              onPressed: _isCaching ? () {} : _preCacheContent,
                                            ),
                                            const SizedBox(height: 16),
                                            // Downloaded Languages Display
                                            FutureBuilder<List<String>>(
                                              future: supabaseService.getDownloadedLanguages(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                                  final languages = snapshot.data!;
                                                  final languageNames = languages.map((code) {
                                                    final lang = supportedLanguages.firstWhere(
                                                      (l) => l['code'] == code,
                                                      orElse: () => {'code': code, 'name': code, 'flag': '🌍'},
                                                    );
                                                    return '${lang['flag']} ${lang['name']}';
                                                  }).join(', ');

                                                  return Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green.withValues(alpha: 0.3),
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: Border.all(
                                                        color: Colors.green.withValues(alpha: 0.5),
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.offline_pin,
                                                              color: Colors.green[800],
                                                              size: 16,
                                                            ),
                                                            const SizedBox(width: 8),
                                                            Text(
                                                              l10n.downloadedLanguages,
                                                              style: GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.green[800],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          languageNames,
                                                          style: GoogleFonts.poppins(
                                                            fontSize: 13,
                                                            color: const Color(0xFF2D2D3A),
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return const SizedBox.shrink();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              _buildSectionDivider('ACCOUNT'),

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
                              const SizedBox(height: 16),

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
      bottomNavigationBar: ref.watch(unlockProvider).isPremium
        ? null
        : const AdBannerWidget(),
    );
  }
}