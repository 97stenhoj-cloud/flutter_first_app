import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import '../../../../core/services/revenue_cat_service.dart';

/// Modern Paywall Button Widget
///
/// Shows RevenueCat's beautifully designed paywall when tapped.
/// Handles all purchase logic automatically.
///
/// Example usage:
/// ```dart
/// ModernPaywallButton(
///   onPurchased: () {
///     // User completed purchase!
///     print('User is now subscribed!');
///   },
/// )
/// ```
class ModernPaywallButton extends StatelessWidget {
  final VoidCallback? onPurchased;
  final VoidCallback? onCancelled;
  final String label;
  final Color? backgroundColor;

  const ModernPaywallButton({
    super.key,
    this.onPurchased,
    this.onCancelled,
    this.label = 'Upgrade to Pro',
    this.backgroundColor,
  });

  Future<void> _showPaywall(BuildContext context) async {
    try {
      final result = await RevenueCatService.presentPaywall();

      if (!context.mounted) return;

      switch (result) {
        case PaywallResult.purchased:
        case PaywallResult.restored:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Welcome to Pro!'),
              backgroundColor: Colors.green,
            ),
          );
          onPurchased?.call();
          break;

        case PaywallResult.cancelled:
          onCancelled?.call();
          break;

        case PaywallResult.error:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('❌ Something went wrong. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
          break;

        default:
          break;
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showPaywall(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Simple function to show paywall from anywhere
///
/// Example:
/// ```dart
/// showModernPaywall(context);
/// ```
Future<PaywallResult> showModernPaywall(BuildContext context) async {
  return await RevenueCatService.presentPaywall();
}
