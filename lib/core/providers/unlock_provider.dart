import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Unlock state class
class UnlockState {
  final bool isPremium;
  final int questionCount;
  final int backButtonCount;
  final String? lastCheckedUserId;

  UnlockState({
    required this.isPremium,
    required this.questionCount,
    required this.backButtonCount,
    this.lastCheckedUserId,
  });

  UnlockState copyWith({
    bool? isPremium,
    int? questionCount,
    int? backButtonCount,
    String? lastCheckedUserId,
  }) {
    return UnlockState(
      isPremium: isPremium ?? this.isPremium,
      questionCount: questionCount ?? this.questionCount,
      backButtonCount: backButtonCount ?? this.backButtonCount,
      lastCheckedUserId: lastCheckedUserId ?? this.lastCheckedUserId,
    );
  }
}

// Unlock state notifier
class UnlockNotifier extends StateNotifier<UnlockState> {
  UnlockNotifier()
      : super(UnlockState(
          isPremium: false,
          questionCount: 0,
          backButtonCount: 0,
        )) {
    initialize();
  }

  Future<void> initialize() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        state = state.copyWith(
          isPremium: false,
          lastCheckedUserId: null,
        );
        return;
      }

      // Check subscription status
      final response = await Supabase.instance.client
          .from('user_subscriptions')
          .select('is_premium')
          .eq('user_id', user.id)
          .maybeSingle();

      final isPremium = response?['is_premium'] ?? false;

      state = state.copyWith(
        isPremium: isPremium,
        lastCheckedUserId: user.id,
      );
    } catch (e) {
      // If error, default to free tier
      state = state.copyWith(isPremium: false);
    }
  }

  Future<void> unlockPremium() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      debugPrint('❌ Cannot unlock premium: User not logged in');
      throw Exception('User not logged in');
    }

    try {
      debugPrint('🔐 Unlocking premium for user: ${user.id}');
      await Supabase.instance.client.from('user_subscriptions').upsert(
        {
          'user_id': user.id,
          'is_premium': true,
          'updated_at': DateTime.now().toIso8601String(),
        },
        onConflict: 'user_id', // Specify which column to check for conflicts
      );

      state = state.copyWith(isPremium: true);
      debugPrint('✅ Premium unlocked successfully');
    } catch (e) {
      debugPrint('❌ Error unlocking premium: $e');
      rethrow; // Let subscription page handle the error
    }
  }

  void lockPremium() {
    state = state.copyWith(isPremium: false);
  }

  void reset() {
    state = UnlockState(
      isPremium: false,
      questionCount: 0,
      backButtonCount: 0,
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

    // Free categories by game mode
    const freeCategoriesByMode = {
      'couple': ['communication', 'fun', 'deep'],
      'friends': ['party', 'funny', 'deep'],
      'family': ['kids', 'teens', 'deep'],
    };

    final freeCategories = freeCategoriesByMode[gameMode.toLowerCase()] ?? [];
    return !freeCategories.contains(category.toLowerCase());
  }

  int getQuestionLimitForCategory(String gameMode, String category) {
    if (state.isPremium) return 75;

    if (isCategoryLocked(gameMode, category)) {
      return 5; // Preview only
    }

    return 30; // Free tier limit
  }

  // Getters for backward compatibility
  bool get isPremium => state.isPremium;
  int get questionCount => state.questionCount;
  int get backButtonCount => state.backButtonCount;
}

// The provider
final unlockProvider = StateNotifierProvider<UnlockNotifier, UnlockState>((ref) {
  return UnlockNotifier();
});
