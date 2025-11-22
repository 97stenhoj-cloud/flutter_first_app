import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Subscription tier enum
enum SubscriptionTier {
  free,
  basic,
  premium,
  premiumPlus;

  String get displayName {
    switch (this) {
      case SubscriptionTier.free:
        return 'Free';
      case SubscriptionTier.basic:
        return 'Basic';
      case SubscriptionTier.premium:
        return 'Premium';
      case SubscriptionTier.premiumPlus:
        return 'Premium+';
    }
  }

  static SubscriptionTier fromString(String tier) {
    switch (tier.toLowerCase()) {
      case 'basic':
        return SubscriptionTier.basic;
      case 'premium':
        return SubscriptionTier.premium;
      case 'premium_plus':
      case 'premiumplus':
        return SubscriptionTier.premiumPlus;
      // Legacy values - map old subscription types to premium
      case '1-bundle':
      case 'premium_monthly':
      case 'premium_yearly':
        return SubscriptionTier.premium;
      default:
        return SubscriptionTier.free;
    }
  }
}

// Unlock state class
class UnlockState {
  final bool isPremium; // Kept for backward compatibility
  final SubscriptionTier subscriptionTier;
  final int questionCount;
  final int backButtonCount;
  final int sparkQuestionsRemaining;
  final String? lastCheckedUserId;
  final DateTime? expirationDate;
  final bool willRenew;

  UnlockState({
    required this.isPremium,
    required this.subscriptionTier,
    required this.questionCount,
    required this.backButtonCount,
    required this.sparkQuestionsRemaining,
    this.lastCheckedUserId,
    this.expirationDate,
    this.willRenew = true,
  });

  bool get isCancelled => !willRenew && expirationDate != null && expirationDate!.isAfter(DateTime.now());

  UnlockState copyWith({
    bool? isPremium,
    SubscriptionTier? subscriptionTier,
    int? questionCount,
    int? backButtonCount,
    int? sparkQuestionsRemaining,
    String? lastCheckedUserId,
    DateTime? expirationDate,
    bool? willRenew,
  }) {
    return UnlockState(
      isPremium: isPremium ?? this.isPremium,
      subscriptionTier: subscriptionTier ?? this.subscriptionTier,
      questionCount: questionCount ?? this.questionCount,
      backButtonCount: backButtonCount ?? this.backButtonCount,
      sparkQuestionsRemaining: sparkQuestionsRemaining ?? this.sparkQuestionsRemaining,
      lastCheckedUserId: lastCheckedUserId ?? this.lastCheckedUserId,
      expirationDate: expirationDate ?? this.expirationDate,
      willRenew: willRenew ?? this.willRenew,
    );
  }
}

// Unlock state notifier
class UnlockNotifier extends StateNotifier<UnlockState> {
  StreamSubscription<AuthState>? _authSubscription;

  UnlockNotifier()
      : super(UnlockState(
          isPremium: false,
          subscriptionTier: SubscriptionTier.free,
          questionCount: 0,
          backButtonCount: 0,
          sparkQuestionsRemaining: 0,
          willRenew: true,
        )) {
    initialize();
    _subscribeToAuthChanges();
  }

  /// Subscribe to Supabase auth state changes to automatically sync premium status
  void _subscribeToAuthChanges() {
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      debugPrint('🔐 Auth state changed: $event');

      if (event == AuthChangeEvent.signedIn ||
          event == AuthChangeEvent.tokenRefreshed ||
          event == AuthChangeEvent.initialSession) {
        debugPrint('🔐 Auth event: $event - reinitializing premium status');
        initialize();
      } else if (event == AuthChangeEvent.signedOut) {
        debugPrint('🚪 User signed out - resetting premium status');
        reset();
      }
    });
  }

  Future<void> initialize() async {
    final user = Supabase.instance.client.auth.currentUser;
    debugPrint('🔍 Initializing unlock provider for user: ${user?.id ?? "none"}');

    if (user == null) {
      debugPrint('⚠️ No user found - setting premium to false');
      state = state.copyWith(
        isPremium: false,
        lastCheckedUserId: null,
      );
      return;
    }

    // First, load cached premium status
    final prefs = await SharedPreferences.getInstance();
    final cachedPremium = prefs.getBool('is_premium_${user.id}');

    if (cachedPremium != null) {
      debugPrint('📦 Loaded cached premium status: $cachedPremium');
      state = state.copyWith(
        isPremium: cachedPremium,
        lastCheckedUserId: user.id,
      );
    }

    // Then try to refresh from database (but don't fail if offline)
    try {
      debugPrint('📡 Fetching subscription status from database for user: ${user.id}');
      final response = await Supabase.instance.client
          .from('user_subscriptions')
          .select('is_premium, subscription_tier, expiration_date, will_renew')
          .eq('user_id', user.id)
          .maybeSingle();

      final isPremium = response?['is_premium'] ?? false;
      final tierString = response?['subscription_tier'] ?? 'free';
      final subscriptionTier = SubscriptionTier.fromString(tierString);
      final expirationDateString = response?['expiration_date'] as String?;
      final expirationDate = expirationDateString != null ? DateTime.tryParse(expirationDateString) : null;
      final willRenew = response?['will_renew'] ?? true;
      debugPrint('✅ Subscription status loaded: tier=$tierString, isPremium=$isPremium, willRenew=$willRenew, expires=$expirationDate');

      // Fetch Spark usage for current period
      int sparkRemaining = 0;
      try {
        final sparkResponse = await Supabase.instance.client
            .rpc('get_spark_remaining', params: {'p_user_id': user.id});
        sparkRemaining = sparkResponse ?? 0;
        debugPrint('✅ Spark remaining: $sparkRemaining');
      } catch (e) {
        debugPrint('⚠️ Could not fetch Spark usage: $e');
      }

      // Save to cache
      await prefs.setBool('is_premium_${user.id}', isPremium);
      await prefs.setString('subscription_tier_${user.id}', tierString);
      await prefs.setInt('spark_remaining_${user.id}', sparkRemaining);

      state = state.copyWith(
        isPremium: isPremium,
        subscriptionTier: subscriptionTier,
        sparkQuestionsRemaining: sparkRemaining,
        lastCheckedUserId: user.id,
        expirationDate: expirationDate,
        willRenew: willRenew,
      );
    } catch (e) {
      debugPrint('⚠️ Could not fetch subscription status from database (offline?): $e');

      // If we have cached status, use that; otherwise default to free
      if (cachedPremium != null) {
        debugPrint('✅ Using cached subscription status');
        final cachedTier = prefs.getString('subscription_tier_${user.id}') ?? 'free';
        final cachedSparkRemaining = prefs.getInt('spark_remaining_${user.id}') ?? 0;
        state = state.copyWith(
          isPremium: cachedPremium,
          subscriptionTier: SubscriptionTier.fromString(cachedTier),
          sparkQuestionsRemaining: cachedSparkRemaining,
        );
      } else {
        debugPrint('⚠️ No cached status available - defaulting to free tier');
        state = state.copyWith(
          isPremium: false,
          subscriptionTier: SubscriptionTier.free,
          sparkQuestionsRemaining: 0,
        );
      }
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  Future<void> unlockPremium() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      debugPrint('❌ Cannot unlock premium: User not logged in');
      throw Exception('User not logged in');
    }

    int retryCount = 0;
    const maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        debugPrint('🔐 Unlocking premium for user: ${user.id} (attempt ${retryCount + 1}/$maxRetries)');
        await Supabase.instance.client.from('user_subscriptions').upsert(
          {
            'user_id': user.id,
            'is_premium': true,
            'subscription_tier': 'premium', // Set to premium tier for Spark access
            'updated_at': DateTime.now().toIso8601String(),
          },
          onConflict: 'user_id',
        );

        // Cache the premium status
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_premium_${user.id}', true);
        await prefs.setString('subscription_tier_${user.id}', 'premium');

        // Refresh full state including Spark counter
        await initialize();

        debugPrint('✅ Premium unlocked successfully with Spark access');
        return; // Success - exit retry loop
      } catch (e) {
        retryCount++;
        debugPrint('❌ Error unlocking premium (attempt $retryCount/$maxRetries): $e');

        if (retryCount >= maxRetries) {
          debugPrint('⚠️ Max retries reached - premium unlock failed');
          rethrow; // Let subscription page handle the error
        }

        // Exponential backoff: 1s, 2s, 4s
        final delaySeconds = retryCount;
        debugPrint('🔄 Retrying in $delaySeconds seconds...');
        await Future.delayed(Duration(seconds: delaySeconds));
      }
    }
  }

  Future<void> lockPremium() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_premium_${user.id}', false);
      await prefs.setString('subscription_tier_${user.id}', 'free');
      await prefs.setInt('spark_remaining_${user.id}', 0);
    }

    // Refresh full state to ensure ads show and Spark is 0
    await initialize();
  }

  Future<void> updateSubscriptionTier(String tierString) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      debugPrint('❌ Cannot update subscription: User not logged in');
      throw Exception('User not logged in');
    }

    int retryCount = 0;
    const maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        debugPrint('🔐 Updating subscription tier to $tierString for user: ${user.id} (attempt ${retryCount + 1}/$maxRetries)');

        final tier = SubscriptionTier.fromString(tierString);
        final isPremium = tier != SubscriptionTier.free;

        await Supabase.instance.client.from('user_subscriptions').upsert(
          {
            'user_id': user.id,
            'is_premium': isPremium,
            'subscription_tier': tierString,
            'updated_at': DateTime.now().toIso8601String(),
          },
          onConflict: 'user_id',
        );

        // Cache the subscription status
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_premium_${user.id}', isPremium);
        await prefs.setString('subscription_tier_${user.id}', tierString);

        // Refresh full state including Spark counter
        await initialize();

        debugPrint('✅ Subscription tier updated to $tierString (isPremium: $isPremium)');
        return; // Success - exit retry loop
      } catch (e) {
        retryCount++;
        debugPrint('❌ Error updating subscription tier (attempt $retryCount/$maxRetries): $e');

        if (retryCount >= maxRetries) {
          debugPrint('⚠️ Max retries reached - subscription update failed');
          rethrow;
        }

        final delaySeconds = retryCount;
        debugPrint('🔄 Retrying in $delaySeconds seconds...');
        await Future.delayed(Duration(seconds: delaySeconds));
      }
    }
  }

  void reset() {
    state = UnlockState(
      isPremium: false,
      subscriptionTier: SubscriptionTier.free,
      questionCount: 0,
      backButtonCount: 0,
      sparkQuestionsRemaining: 0,
    );
  }

  void incrementQuestionCount() {
    state = state.copyWith(questionCount: state.questionCount + 1);
  }

  void resetQuestionCount() {
    state = state.copyWith(questionCount: 0);
  }

  void incrementBackButtonCount() {
    state = state.copyWith(backButtonCount: state.backButtonCount + 1);
  }

  bool shouldShowAd() {
    return !state.isPremium && state.questionCount > 0 && state.questionCount % 7 == 0;
  }

  bool isCategoryLocked(String gameMode, String category) {
    if (state.isPremium) return false;

    // First 4 categories are free (30 questions), last 3 are locked (5 preview)
    const freeCategoriesByMode = {
      'couple': ['Love Talks', 'Deep Talks', 'Silly Talks', 'Car Talks'],
      'friends': ['Cozy Talks', 'Silly Talks', 'Car Talks', 'Party Night Talks'],
      'family': ['Silly Talks', 'Cozy Talks', 'History Talks', 'Car Talks'],
    };

    final freeCategories = freeCategoriesByMode[gameMode.toLowerCase()] ?? [];
    return !freeCategories.contains(category);
  }

  int getQuestionLimitForCategory(String gameMode, String category) {
    if (state.isPremium) return 75;

    if (isCategoryLocked(gameMode, category)) {
      return 5; // Preview only for last 3 categories
    }

    return 30; // Free tier limit for first 4 categories
  }

  // Spark-specific methods
  bool canUseSpark() {
    return state.subscriptionTier == SubscriptionTier.premium ||
           state.subscriptionTier == SubscriptionTier.premiumPlus;
  }

  int getSparkLimit() {
    switch (state.subscriptionTier) {
      case SubscriptionTier.premium:
        return 150;
      case SubscriptionTier.premiumPlus:
        return 400;
      default:
        return 0;
    }
  }

  Future<void> refreshSparkUsage() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    try {
      final sparkResponse = await Supabase.instance.client
          .rpc('get_spark_remaining', params: {'p_user_id': user.id});
      final sparkRemaining = sparkResponse ?? 0;

      state = state.copyWith(sparkQuestionsRemaining: sparkRemaining);

      // Cache the updated value
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('spark_remaining_${user.id}', sparkRemaining);

      debugPrint('✅ Spark usage refreshed: $sparkRemaining remaining');
    } catch (e) {
      debugPrint('⚠️ Could not refresh Spark usage: $e');
    }
  }

  Future<void> incrementSparkUsage(int count) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    try {
      // Get current period or create new one
      final now = DateTime.now();
      final periodStart = DateTime(now.year, now.month, now.day);
      final periodEnd = periodStart.add(const Duration(days: 30));

      // Check if current period exists
      final existingPeriod = await Supabase.instance.client
          .from('spark_usage')
          .select()
          .eq('user_id', user.id)
          .gte('period_end_date', now.toIso8601String())
          .maybeSingle();

      if (existingPeriod != null) {
        // Update existing period
        await Supabase.instance.client
            .from('spark_usage')
            .update({
              'questions_generated': (existingPeriod['questions_generated'] ?? 0) + count,
              'updated_at': now.toIso8601String(),
            })
            .eq('id', existingPeriod['id']);
      } else {
        // Create new period
        await Supabase.instance.client
            .from('spark_usage')
            .insert({
              'user_id': user.id,
              'questions_generated': count,
              'period_start_date': periodStart.toIso8601String(),
              'period_end_date': periodEnd.toIso8601String(),
            });
      }

      // Refresh the remaining count
      await refreshSparkUsage();

      debugPrint('✅ Spark usage incremented by $count');
    } catch (e) {
      debugPrint('❌ Error incrementing Spark usage: $e');
      rethrow;
    }
  }

  // Getters for backward compatibility
  bool get isPremium => state.isPremium;
  int get questionCount => state.questionCount;
  int get backButtonCount => state.backButtonCount;
  int get sparkQuestionsRemaining => state.sparkQuestionsRemaining;
  SubscriptionTier get subscriptionTier => state.subscriptionTier;
}

// The provider
final unlockProvider = StateNotifierProvider<UnlockNotifier, UnlockState>((ref) {
  return UnlockNotifier();
});
