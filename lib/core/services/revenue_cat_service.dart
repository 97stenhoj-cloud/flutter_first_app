import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config/env.dart';

/// Service for managing RevenueCat in-app purchases and subscriptions
///
/// This service handles:
/// - RevenueCat SDK initialization
/// - Product fetching and purchasing
/// - Purchase restoration
/// - Entitlement checking
/// - User identification with Supabase auth
/// - Purchase event listeners for real-time updates
///
/// Currently configured with SANDBOX/TEST keys for testing without real money.
class RevenueCatService {
  // Callback for when customer info updates (purchases, renewals, etc.)
  static void Function(CustomerInfo)? _onCustomerInfoUpdate;

  /// Set a callback to be notified when customer info updates
  ///
  /// This is called when:
  /// - User makes a purchase
  /// - Subscription renews
  /// - Subscription expires
  /// - Purchases are restored
  ///
  /// Use this to refresh your app's premium status from Supabase.
  ///
  /// Example:
  /// ```dart
  /// RevenueCatService.setOnCustomerInfoUpdate((customerInfo) async {
  ///   // Refresh unlock provider from Supabase
  ///   await ref.read(unlockProvider.notifier).initialize();
  /// });
  /// ```
  static void setOnCustomerInfoUpdate(void Function(CustomerInfo) callback) {
    _onCustomerInfoUpdate = callback;
  }
  // Using Env class to load keys from .env file
  static String get _appleApiKey => Env.revenueCatIosKey;
  static String get _googleApiKey => Env.revenueCatAndroidKey;

  // Product identifiers - Update these to match your RevenueCat products
  static const String productMonthly = 'monthly';
  static const String productYearly = 'yearly';
  static const String productLifetime = 'lifetime';

  // Legacy products (for existing Connect app tiers)
  static const String productBasicMonthly = 'basic_monthly';
  static const String productPremiumMonthly = 'premium_monthly';
  static const String productPremiumPlusMonthly = 'premium_plus_monthly';

  // Entitlement identifier - matches "TechyKoala Pro" or "Connect Premium"
  static const String entitlementPro = 'pro';  // Configure this in RevenueCat dashboard

  // Offering identifier (default offering in RevenueCat dashboard)
  static const String defaultOfferingId = 'default';

  /// Initialize RevenueCat SDK
  ///
  /// Should be called once during app startup, after Supabase initialization.
  /// Links the RevenueCat user with the Supabase auth user ID.
  static Future<void> initialize() async {
    try {
      if (_appleApiKey.isEmpty && _googleApiKey.isEmpty) {
        debugPrint('⚠️ [RevenueCat] No API keys configured, skipping initialization');
        debugPrint('💡 [RevenueCat] Set REVENUECAT_IOS_KEY and REVENUECAT_ANDROID_KEY');
        return;
      }

      // Enable debug logs in debug mode
      await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.info);

      // Configure SDK based on platform
      PurchasesConfiguration configuration;
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        if (_appleApiKey.isEmpty) {
          debugPrint('⚠️ [RevenueCat] iOS API key not configured');
          return;
        }
        configuration = PurchasesConfiguration(_appleApiKey);
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        if (_googleApiKey.isEmpty) {
          debugPrint('⚠️ [RevenueCat] Android API key not configured');
          return;
        }
        configuration = PurchasesConfiguration(_googleApiKey);
      } else {
        debugPrint('⚠️ [RevenueCat] Platform not supported');
        return;
      }

      await Purchases.configure(configuration);
      debugPrint('✅ [RevenueCat] SDK initialized');

      // Set up listener for customer info updates
      Purchases.addCustomerInfoUpdateListener((customerInfo) {
        debugPrint('📲 [RevenueCat] Customer info updated');
        debugPrint('📦 [RevenueCat] Active entitlements: ${customerInfo.entitlements.active.keys}');

        // Notify callback if set
        _onCustomerInfoUpdate?.call(customerInfo);
      });
      debugPrint('✅ [RevenueCat] Purchase listener configured');

      // Link with Supabase user if authenticated
      await _linkSupabaseUser();
    } catch (e) {
      debugPrint('❌ [RevenueCat] Initialization error: $e');
      // Don't throw - allow app to continue without RevenueCat
    }
  }

  /// Link RevenueCat user with Supabase auth user
  static Future<void> _linkSupabaseUser() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user != null) {
        await Purchases.logIn(user.id);
        debugPrint('✅ [RevenueCat] Linked with Supabase user: ${user.id}');
      }
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error linking user: $e');
    }
  }

  /// Call this after user signs in to link their purchases
  static Future<void> onUserSignIn(String userId) async {
    try {
      await Purchases.logIn(userId);
      debugPrint('✅ [RevenueCat] User logged in: $userId');
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error logging in user: $e');
    }
  }

  /// Call this when user signs out
  static Future<void> onUserSignOut() async {
    try {
      await Purchases.logOut();
      debugPrint('✅ [RevenueCat] User logged out');
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error logging out: $e');
    }
  }

  /// Get available subscription offerings
  ///
  /// Returns the default offering configured in RevenueCat dashboard.
  /// Returns null if no offerings are available.
  static Future<Offering?> getOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();

      if (offerings.current == null) {
        debugPrint('⚠️ [RevenueCat] No offerings available');
        return null;
      }

      debugPrint('✅ [RevenueCat] Loaded ${offerings.current!.availablePackages.length} packages');

      // Debug: Print all available product IDs
      for (final package in offerings.current!.availablePackages) {
        debugPrint('📦 [RevenueCat] Package: ${package.identifier}, Product ID: ${package.storeProduct.identifier}');
      }

      return offerings.current;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error fetching offerings: $e');
      return null;
    }
  }

  /// Purchase a specific product
  ///
  /// [productId] should be one of: basic_monthly, premium_monthly, premium_plus_monthly
  ///
  /// Returns CustomerInfo if successful, null otherwise.
  /// The webhook will automatically sync the subscription to Supabase.
  static Future<CustomerInfo?> purchaseProduct(String productId) async {
    try {
      debugPrint('🛒 [RevenueCat] Attempting purchase: $productId');

      final offerings = await getOfferings();
      if (offerings == null) {
        throw PlatformException(
          code: 'NO_OFFERINGS',
          message: 'No subscription offerings available',
        );
      }

      // Find the package matching the product ID
      final package = offerings.availablePackages.firstWhere(
        (p) => p.storeProduct.identifier == productId,
        orElse: () => throw PlatformException(
          code: 'PRODUCT_NOT_FOUND',
          message: 'Product $productId not found in offerings',
        ),
      );

      // Initiate purchase
      final purchaserInfo = await Purchases.purchasePackage(package);

      debugPrint('✅ [RevenueCat] Purchase successful');
      debugPrint('📦 [RevenueCat] Active entitlements: ${purchaserInfo.entitlements.active.keys}');

      return purchaserInfo;
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);

      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        debugPrint('ℹ️ [RevenueCat] Purchase cancelled by user');
      } else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
        debugPrint('❌ [RevenueCat] Purchase not allowed');
      } else if (errorCode == PurchasesErrorCode.paymentPendingError) {
        debugPrint('⏳ [RevenueCat] Payment pending');
      } else {
        debugPrint('❌ [RevenueCat] Purchase error: ${e.code} - ${e.message}');
      }

      return null;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Unexpected purchase error: $e');
      return null;
    }
  }

  /// Restore previous purchases
  ///
  /// Useful when user reinstalls the app or switches devices.
  /// Returns CustomerInfo if successful.
  static Future<CustomerInfo?> restorePurchases() async {
    try {
      debugPrint('🔄 [RevenueCat] Restoring purchases...');

      final customerInfo = await Purchases.restorePurchases();

      debugPrint('✅ [RevenueCat] Purchases restored');
      debugPrint('📦 [RevenueCat] Active entitlements: ${customerInfo.entitlements.active.keys}');

      return customerInfo;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error restoring purchases: $e');
      return null;
    }
  }

  /// Check if user has active premium entitlement
  ///
  /// This checks RevenueCat's local cache. For the source of truth,
  /// your app should rely on the Supabase database which is synced via webhooks.
  static Future<bool> hasActivePremium() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();

      // Check if user has any active entitlements
      final hasActive = customerInfo.entitlements.active.isNotEmpty;

      debugPrint('📊 [RevenueCat] Has active premium: $hasActive');
      return hasActive;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error checking entitlements: $e');
      return false;
    }
  }

  /// Get current customer info from RevenueCat
  static Future<CustomerInfo?> getCustomerInfo() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error getting customer info: $e');
      return null;
    }
  }

  /// Map product ID to subscription tier name
  ///
  /// Used for display purposes and consistency with Supabase tier naming.
  static String getTierNameFromProductId(String productId) {
    switch (productId) {
      case productBasicMonthly:
        return 'Basic';
      case productPremiumMonthly:
        return 'Premium';
      case productPremiumPlusMonthly:
        return 'Premium+';
      default:
        return 'Unknown';
    }
  }

  /// Get product ID from tier string
  ///
  /// Converts Supabase tier naming to RevenueCat product IDs.
  ///
  /// All tiers are now monthly subscriptions:
  /// - Basic (€6.99/month) → basic_monthly
  /// - Premium (€11.99/month) → premium_monthly
  /// - Premium+ (€19.99/month) → premium_plus_monthly
  static String getProductIdFromTier(String tier) {
    switch (tier.toLowerCase()) {
      case 'basic':
        return productBasicMonthly;
      case 'premium':
        return productPremiumMonthly;
      case 'premium_plus':
      case 'premiumplus':
        return productPremiumPlusMonthly;
      default:
        return '';
    }
  }

  /// Check if RevenueCat is properly configured
  static bool isConfigured() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _appleApiKey.isNotEmpty;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return _googleApiKey.isNotEmpty;
    }
    return false;
  }

  // ============================================================================
  // MODERN REVENUECAT UI FEATURES
  // ============================================================================

  /// Check if user has active Pro entitlement
  ///
  /// This is the modern way to check subscription status.
  /// Returns true if user has "TechyKoala Pro" or any active entitlement.
  static Future<bool> hasActiveProEntitlement() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();

      // Check for specific "pro" entitlement
      final hasPro = customerInfo.entitlements.active.containsKey(entitlementPro);

      debugPrint('📊 [RevenueCat] Has Pro entitlement: $hasPro');
      return hasPro;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error checking Pro entitlement: $e');
      return false;
    }
  }

  /// Present RevenueCat Paywall (Modern UI)
  ///
  /// Shows a beautifully designed paywall with your products.
  /// Handles purchases automatically.
  ///
  /// Returns:
  /// - `PaywallResult.purchased` if user completed purchase
  /// - `PaywallResult.cancelled` if user dismissed
  /// - `PaywallResult.restored` if purchases were restored
  /// - `PaywallResult.error` if an error occurred
  ///
  /// Example usage:
  /// ```dart
  /// final result = await RevenueCatService.presentPaywall();
  /// if (result == PaywallResult.purchased) {
  ///   // User subscribed!
  /// }
  /// ```
  static Future<PaywallResult> presentPaywall({String? offeringId}) async {
    try {
      debugPrint('🎨 [RevenueCat] Presenting paywall...');

      // If offering ID is provided, fetch that specific offering
      Offering? offering;
      if (offeringId != null) {
        final offerings = await Purchases.getOfferings();
        offering = offerings.all[offeringId];
      }

      final result = await RevenueCatUI.presentPaywall(
        offering: offering,
      );

      debugPrint('✅ [RevenueCat] Paywall result: $result');
      return result;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Paywall error: $e');
      return PaywallResult.error;
    }
  }

  /// Present RevenueCat Paywall if user is not subscribed
  ///
  /// Convenience method that checks subscription status first.
  /// Only shows paywall if user doesn't have active Pro entitlement.
  ///
  /// Returns true if user has subscription (either already had it or just purchased).
  static Future<bool> presentPaywallIfNeeded() async {
    try {
      // Check if already subscribed
      final hasSubscription = await hasActiveProEntitlement();

      if (hasSubscription) {
        debugPrint('✅ [RevenueCat] User already has subscription');
        return true;
      }

      // Show paywall
      final result = await presentPaywall();

      if (result == PaywallResult.purchased || result == PaywallResult.restored) {
        debugPrint('✅ [RevenueCat] User now has subscription');
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error in presentPaywallIfNeeded: $e');
      return false;
    }
  }

  /// Present Customer Center (Modern UI)
  ///
  /// Shows a screen where users can:
  /// - Manage their subscription
  /// - Change plans
  /// - Cancel subscription
  /// - Restore purchases
  /// - View billing info
  ///
  /// This is the modern replacement for building custom subscription management screens.
  ///
  /// Example usage:
  /// ```dart
  /// await RevenueCatService.presentCustomerCenter();
  /// ```
  static Future<void> presentCustomerCenter() async {
    try {
      debugPrint('⚙️ [RevenueCat] Presenting Customer Center...');

      await RevenueCatUI.presentCustomerCenter();

      debugPrint('✅ [RevenueCat] Customer Center dismissed');
    } catch (e) {
      debugPrint('❌ [RevenueCat] Customer Center error: $e');
      // Error handling - Customer Center may not be available in all configurations
    }
  }

  /// Get detailed subscription information
  ///
  /// Returns a formatted summary of the user's subscription status.
  /// Useful for debugging or displaying to users.
  static Future<Map<String, dynamic>> getSubscriptionInfo() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();

      final info = {
        'has_active_subscription': customerInfo.entitlements.active.isNotEmpty,
        'active_entitlements': customerInfo.entitlements.active.keys.toList(),
        'all_entitlements': customerInfo.entitlements.all.keys.toList(),
        'active_subscriptions': customerInfo.activeSubscriptions,
        'all_purchased_product_ids': customerInfo.allPurchasedProductIdentifiers.toList(),
        'latest_expiration_date': customerInfo.latestExpirationDate,
        'original_app_user_id': customerInfo.originalAppUserId,
        'management_url': customerInfo.managementURL?.toString(),
      };

      debugPrint('📊 [RevenueCat] Subscription info: $info');
      return info;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error getting subscription info: $e');
      return {};
    }
  }

  /// Check if user has any active subscription (any product)
  ///
  /// More flexible than checking specific entitlement.
  /// Returns true if user has purchased ANY product.
  static Future<bool> hasAnyActiveSubscription() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final hasActive = customerInfo.activeSubscriptions.isNotEmpty ||
          customerInfo.entitlements.active.isNotEmpty;

      debugPrint('📊 [RevenueCat] Has any subscription: $hasActive');
      return hasActive;
    } catch (e) {
      debugPrint('❌ [RevenueCat] Error checking subscriptions: $e');
      return false;
    }
  }
}
