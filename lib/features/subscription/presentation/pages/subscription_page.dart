// lib/features/subscription/presentation/pages/subscription_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../l10n/app_localizations.dart';

class SubscriptionPage extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const SubscriptionPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  ConsumerState<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends ConsumerState<SubscriptionPage> {
  bool isLoading = false;
  bool isYearly = true; // Default to yearly (better value)

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Premium Badge Icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFD4A574),
                              Color(0xFFB8956A),
                            ],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD4A574).withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.stars,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Title
                      Text(
                        l10n.unlockEverything,
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      
                      // Description
                      Text(
                        l10n.premiumSubtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      
                      // Pricing Toggle
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: widget.isDarkMode ? 0.1 : 0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: widget.isDarkMode ? 0.2 : 0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildPricingOption(
                                label: l10n.monthly,
                                isSelected: !isYearly,
                                onTap: () => setState(() => isYearly = false),
                              ),
                            ),
                            Expanded(
                              child: _buildPricingOption(
                                label: l10n.yearly,
                                isSelected: isYearly,
                                onTap: () => setState(() => isYearly = true),
                                badge: l10n.save32Percent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Premium Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFD4A574),
                              Color(0xFFB8956A),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD4A574).withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Price
                            Text(
                              isYearly ? l10n.priceYearly : l10n.priceMonthly,
                              style: GoogleFonts.poppins(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            
                            Text(
                              isYearly ? l10n.billedAnnually : l10n.billedMonthly,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            
                            if (isYearly) ...[
                              const SizedBox(height: 8),
                              Text(
                                l10n.equivalentMonthly,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                            
                            const SizedBox(height: 8),
                            
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                l10n.premium,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            
                            // Features
                            _buildFeature(l10n.feature24Categories),
                            const SizedBox(height: 16),
                            _buildFeature(l10n.featurePersonalDecks),  // <-- ADD THIS
                            const SizedBox(height: 16),
                            _buildFeature(l10n.feature75Questions),
                            const SizedBox(height: 16),
                            _buildFeature(l10n.featureNoAds),
                            const SizedBox(height: 16),
                            _buildFeature(l10n.featureUnlimitedPlayers),
                            const SizedBox(height: 16),
                            _buildFeature(l10n.featureQuestionNavigation),
                            const SizedBox(height: 16),
                            _buildFeature(l10n.featureSupportDevelopment),
                            const SizedBox(height: 32),
                            
                            // Subscribe Button
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: isLoading ? null : _handleSubscribe,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFFD4A574),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 0,
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation(Color(0xFFD4A574)),
                                        ),
                                      )
                                    : Text(
                                        l10n.subscribe,
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
                      const SizedBox(height: 32),
                      
                      // Free Tier Info
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: widget.isDarkMode ? 0.05 : 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: widget.isDarkMode ? 0.1 : 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.freeTier,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              l10n.freeTierDesc,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Demo note
                      Text(
                        l10n.demoNote,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getBodyTextColor(widget.isDarkMode).withValues(alpha: 0.6),
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPricingOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    String? badge,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFFD4A574)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Colors.white
                    : ThemeHelper.getBodyTextColor(widget.isDarkMode),
              ),
            ),
            if (badge != null && isSelected) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubscribe() async {
  final l10n = AppLocalizations.of(context)!;
  setState(() => isLoading = true);
  
  try {
    debugPrint('🔐 [Subscription] Calling unlockPremium...');
    await ref.read(unlockProvider.notifier).unlockPremium();
    debugPrint('✅ [Subscription] Premium unlocked! Status: ${ref.read(unlockProvider).isPremium}');
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.premiumActivatedMessage,
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: const Color(0xFFD4A574),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(context, true);
    }
  } catch (e) {
    debugPrint('❌ [Subscription] Error: $e');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${l10n.error}: $e',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  } finally {
    if (mounted) {
      setState(() => isLoading = false);
    }
  }
}
}