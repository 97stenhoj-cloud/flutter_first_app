// lib/features/subscription/presentation/pages/subscription_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../l10n/app_localizations.dart';

class SubscriptionPage extends StatefulWidget {
  final bool isDarkMode;
  
  const SubscriptionPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final unlockManager = UnlockManager();
  bool isLoading = false;
  bool isYearly = true; // Default to yearly (better value)

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: ThemeHelper.getGameBackgroundColor('couple', widget.isDarkMode),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Title
            Text(
              'Unlock Everything',
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
              'Get unlimited access to all categories across all modes, remove ads forever',
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
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildPricingOption(
                      label: 'Monthly',
                      isSelected: !isYearly,
                      onTap: () => setState(() => isYearly = false),
                    ),
                  ),
                  Expanded(
                    child: _buildPricingOption(
                      label: 'Yearly',
                      isSelected: isYearly,
                      onTap: () => setState(() => isYearly = true),
                      badge: 'SAVE',
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
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFD4A574),
                    const Color(0xFFB8956A),
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
                    isYearly ? '399 DKK/year' : '49 DKK/month',
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  Text(
                    isYearly ? 'Billed annually' : 'Billed monthly',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'PREMIUM',
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
                  _buildFeature('✓ All 24 premium categories unlocked'),
                  const SizedBox(height: 16),
                  _buildFeature('✓ No ads forever'),
                  const SizedBox(height: 16),
                  _buildFeature('✓ Unlimited questions in all categories'),
                  const SizedBox(height: 16),
                  _buildFeature('✓ Pandora: Unlimited players & questions'),
                  const SizedBox(height: 16),
                  _buildFeature('✓ Support ongoing development'),
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
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Free Tier',
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
          ],
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
                  color: Colors.white.withValues(alpha: 0.2),
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
    setState(() => isLoading = true);
    
    try {
      await unlockManager.unlockPremium();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Premium activated! All categories unlocked.'),
            backgroundColor: const Color(0xFFD4A574),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
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