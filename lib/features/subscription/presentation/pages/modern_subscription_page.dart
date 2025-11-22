import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import '../../../../core/services/revenue_cat_service.dart';
import '../widgets/modern_paywall_button.dart';
import '../widgets/customer_center_button.dart';

/// Modern Subscription Page using RevenueCat UI
///
/// This is the modern way to implement subscriptions with RevenueCat.
/// Uses pre-built UI components for paywall and customer center.
///
/// Features:
/// - Modern paywall UI (configured in RevenueCat dashboard)
/// - Customer Center for subscription management
/// - Entitlement checking
/// - Subscription info display
class ModernSubscriptionPage extends StatefulWidget {
  const ModernSubscriptionPage({super.key});

  @override
  State<ModernSubscriptionPage> createState() => _ModernSubscriptionPageState();
}

class _ModernSubscriptionPageState extends State<ModernSubscriptionPage> {
  bool _isSubscribed = false;
  bool _isLoading = true;
  Map<String, dynamic> _subscriptionInfo = {};

  @override
  void initState() {
    super.initState();
    _checkSubscriptionStatus();
  }

  Future<void> _checkSubscriptionStatus() async {
    setState(() => _isLoading = true);

    try {
      // Check if user has Pro entitlement
      final hasSubscription = await RevenueCatService.hasActiveProEntitlement();

      // Get detailed subscription info
      final info = await RevenueCatService.getSubscriptionInfo();

      setState(() {
        _isSubscribed = hasSubscription;
        _subscriptionInfo = info;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Error checking subscription: $e');
    }
  }

  Future<void> _showPaywall() async {
    final result = await RevenueCatService.presentPaywall();

    if (result == PaywallResult.purchased || result == PaywallResult.restored) {
      // Refresh subscription status
      await _checkSubscriptionStatus();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('🎉 Welcome to Pro!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Future<void> _restorePurchases() async {
    setState(() => _isLoading = true);

    final customerInfo = await RevenueCatService.restorePurchases();

    if (customerInfo != null) {
      await _checkSubscriptionStatus();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Purchases restored'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      setState(() => _isLoading = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No purchases found to restore'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _checkSubscriptionStatus,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Subscription Status Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            _isSubscribed ? Icons.check_circle : Icons.lock,
                            size: 64,
                            color: _isSubscribed ? Colors.green : Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _isSubscribed ? 'Pro Member' : 'Free Plan',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isSubscribed
                                ? 'You have access to all premium features'
                                : 'Upgrade to unlock premium features',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Buttons
                  if (!_isSubscribed) ...[
                    // Show Modern Paywall
                    ModernPaywallButton(
                      onPurchased: _checkSubscriptionStatus,
                    ),
                    const SizedBox(height: 16),
                  ],

                  if (_isSubscribed) ...[
                    // Customer Center (Manage Subscription)
                    ElevatedButton.icon(
                      onPressed: () async {
                        await RevenueCatService.presentCustomerCenter();
                        _checkSubscriptionStatus();
                      },
                      icon: const Icon(Icons.settings),
                      label: const Text('Manage Subscription'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Restore Purchases
                  OutlinedButton.icon(
                    onPressed: _restorePurchases,
                    icon: const Icon(Icons.restore),
                    label: const Text('Restore Purchases'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Subscription Details (Debug Info)
                  if (_subscriptionInfo.isNotEmpty) ...[
                    Text(
                      'Subscription Details',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow(
                              'Status',
                              _subscriptionInfo['has_active_subscription'] == true
                                  ? 'Active'
                                  : 'Inactive',
                            ),
                            if (_subscriptionInfo['active_entitlements'] != null &&
                                (_subscriptionInfo['active_entitlements'] as List)
                                    .isNotEmpty)
                              _buildInfoRow(
                                'Entitlements',
                                (_subscriptionInfo['active_entitlements'] as List)
                                    .join(', '),
                              ),
                            if (_subscriptionInfo['active_subscriptions'] != null &&
                                (_subscriptionInfo['active_subscriptions'] as List)
                                    .isNotEmpty)
                              _buildInfoRow(
                                'Active Products',
                                (_subscriptionInfo['active_subscriptions'] as List)
                                    .join(', '),
                              ),
                            if (_subscriptionInfo['latest_expiration_date'] != null)
                              _buildInfoRow(
                                'Expires',
                                _subscriptionInfo['latest_expiration_date']
                                    .toString(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Premium Features List
                  Text(
                    'Premium Features',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        _buildFeatureTile(
                          '✨ Unlimited Access',
                          'Access all categories and questions',
                          _isSubscribed,
                        ),
                        _buildFeatureTile(
                          '🤖 AI-Powered Features',
                          'Spark AI question generation',
                          _isSubscribed,
                        ),
                        _buildFeatureTile(
                          '📴 Offline Mode',
                          '30-day offline caching',
                          _isSubscribed,
                        ),
                        _buildFeatureTile(
                          '🚫 Ad-Free',
                          'No advertisements',
                          _isSubscribed,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(String title, String subtitle, bool isEnabled) {
    return ListTile(
      leading: Icon(
        isEnabled ? Icons.check_circle : Icons.lock,
        color: isEnabled ? Colors.green : Colors.grey,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
