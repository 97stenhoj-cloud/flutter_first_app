// lib/features/subscription/presentation/pages/subscription_page_new.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../l10n/app_localizations.dart';

class SubscriptionPageNew extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const SubscriptionPageNew({
    super.key,
    required this.isDarkMode,
  });

  @override
  ConsumerState<SubscriptionPageNew> createState() => _SubscriptionPageNewState();
}

class _SubscriptionPageNewState extends ConsumerState<SubscriptionPageNew> {
  bool isLoading = false;
  String selectedTier = 'premium'; // Default to Premium

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
                      // Title
                      Text(
                        'Choose Your Plan',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      // Subtitle
                      Text(
                        'Unlock premium features and AI-powered conversations',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      // Basic Tier Card
                      _buildTierCard(
                        title: 'Basic',
                        price: '€6.99',
                        priceSubtext: 'per month',
                        description: 'Access all game modes except Spark',
                        features: [
                          'All game modes (Couple, Friends, Family, Personal, Pandora)',
                          'Access to all 24+ categories',
                          'Custom personal decks',
                          'No ads',
                          'Question navigation',
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9E9E9E), Color(0xFF757575)],
                        ),
                        isSelected: selectedTier == 'basic',
                        onSelect: () => setState(() => selectedTier = 'basic'),
                        tier: 'basic',
                      ),
                      const SizedBox(height: 16),

                      // Premium Tier Card (MOST POPULAR)
                      Stack(
                        children: [
                          _buildTierCard(
                            title: 'Premium',
                            price: '€11.99',
                            priceSubtext: 'per month',
                            description: 'Everything in Basic + Spark AI',
                            features: [
                              'Everything in Basic',
                              '🔥 Spark Mode: AI-powered questions',
                              '150 AI questions per month',
                              'Generate 5-25 questions at once',
                              'Custom sliders (Energy, Depth, Spice)',
                              'Save favorites to personal decks',
                            ],
                            gradient: const LinearGradient(
                              colors: [Color(0xFFD4A574), Color(0xFFB8956A)],
                            ),
                            isSelected: selectedTier == 'premium',
                            onSelect: () => setState(() => selectedTier = 'premium'),
                            tier: 'premium',
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFFF6B9D), Color(0xFFFF8FA3)],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                'MOST POPULAR',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Premium+ Tier Card
                      _buildTierCard(
                        title: 'Premium+',
                        price: '€19.99',
                        priceSubtext: 'per month',
                        description: 'Maximum AI power',
                        features: [
                          'Everything in Premium',
                          '🚀 400 AI questions per month',
                          '2.5x more Spark questions',
                          'Perfect for frequent use',
                          'Priority support',
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
                        ),
                        isSelected: selectedTier == 'premium_plus',
                        onSelect: () => setState(() => selectedTier = 'premium_plus'),
                        tier: 'premium_plus',
                      ),
                      const SizedBox(height: 32),

                      // Subscribe Button
                      Container(
                        decoration: BoxDecoration(
                          gradient: _getGradientForTier(selectedTier),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: _getColorForTier(selectedTier).withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _handleSubscribe,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  ),
                                )
                              : Text(
                                  'Subscribe to ${_getTierDisplayName(selectedTier)}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Terms
                      Text(
                        'Cancel anytime. No hidden fees.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getBodyTextColor(widget.isDarkMode).withValues(alpha: 0.6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
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

  Widget _buildTierCard({
    required String title,
    required String price,
    required String priceSubtext,
    required String description,
    required List<String> features,
    required LinearGradient gradient,
    required bool isSelected,
    required VoidCallback onSelect,
    required String tier,
  }) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: isSelected ? gradient : null,
          color: isSelected ? null : Colors.white.withValues(alpha: widget.isDarkMode ? 0.05 : 0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? Colors.white.withValues(alpha: 0.3)
                : Colors.white.withValues(alpha: widget.isDarkMode ? 0.1 : 0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: _getColorForTier(tier).withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tier name
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : ThemeHelper.getHeadingTextColor(widget.isDarkMode),
              ),
            ),
            const SizedBox(height: 8),

            // Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  priceSubtext,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: isSelected
                        ? Colors.white.withValues(alpha: 0.9)
                        : ThemeHelper.getBodyTextColor(widget.isDarkMode),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.9)
                    : ThemeHelper.getBodyTextColor(widget.isDarkMode),
              ),
            ),
            const SizedBox(height: 20),

            // Features
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: isSelected ? Colors.white : const Color(0xFF4CAF50),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: isSelected
                                ? Colors.white.withValues(alpha: 0.95)
                                : ThemeHelper.getBodyTextColor(widget.isDarkMode),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  LinearGradient _getGradientForTier(String tier) {
    switch (tier) {
      case 'basic':
        return const LinearGradient(colors: [Color(0xFF9E9E9E), Color(0xFF757575)]);
      case 'premium':
        return const LinearGradient(colors: [Color(0xFFD4A574), Color(0xFFB8956A)]);
      case 'premium_plus':
        return const LinearGradient(colors: [Color(0xFF9C27B0), Color(0xFF673AB7)]);
      default:
        return const LinearGradient(colors: [Color(0xFFD4A574), Color(0xFFB8956A)]);
    }
  }

  Color _getColorForTier(String tier) {
    switch (tier) {
      case 'basic':
        return const Color(0xFF9E9E9E);
      case 'premium':
        return const Color(0xFFD4A574);
      case 'premium_plus':
        return const Color(0xFF9C27B0);
      default:
        return const Color(0xFFD4A574);
    }
  }

  String _getTierDisplayName(String tier) {
    switch (tier) {
      case 'basic':
        return 'Basic';
      case 'premium':
        return 'Premium';
      case 'premium_plus':
        return 'Premium+';
      default:
        return 'Premium';
    }
  }

  Future<void> _handleSubscribe() async {
    setState(() {
      isLoading = true;
    });

    try {
      // TODO: Implement actual payment logic with RevenueCat or Stripe
      // For now, just update the subscription tier in the database
      debugPrint('📦 [Subscription] Selected tier: $selectedTier');

      // Update subscription tier based on selection
      await ref.read(unlockProvider.notifier).updateSubscriptionTier(selectedTier);
      debugPrint('✅ [Subscription] Subscription tier updated to: $selectedTier');

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      debugPrint('❌ [Subscription] Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
