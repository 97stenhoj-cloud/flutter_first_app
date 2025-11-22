import 'package:flutter/material.dart';
import '../../../../core/services/revenue_cat_service.dart';

/// Customer Center Button Widget
///
/// Opens RevenueCat's Customer Center where users can:
/// - Manage their subscription
/// - Change plans
/// - Cancel subscription
/// - Restore purchases
/// - View billing history
///
/// Example usage:
/// ```dart
/// CustomerCenterButton()
/// ```
class CustomerCenterButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextStyle? textStyle;

  const CustomerCenterButton({
    super.key,
    this.label = 'Manage Subscription',
    this.icon = Icons.settings,
    this.textStyle,
  });

  Future<void> _openCustomerCenter(BuildContext context) async {
    try {
      await RevenueCatService.presentCustomerCenter();
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to open subscription management: $e'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _openCustomerCenter(context),
      icon: Icon(icon),
      label: Text(
        label,
        style: textStyle,
      ),
    );
  }
}

/// List tile version for settings pages
class CustomerCenterListTile extends StatelessWidget {
  final String title;
  final String? subtitle;

  const CustomerCenterListTile({
    super.key,
    this.title = 'Manage Subscription',
    this.subtitle,
  });

  Future<void> _openCustomerCenter(BuildContext context) async {
    try {
      await RevenueCatService.presentCustomerCenter();
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to open subscription management: $e'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.card_membership),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _openCustomerCenter(context),
    );
  }
}
