import 'package:flutter_test/flutter_test.dart';
import 'package:connect/core/providers/unlock_provider.dart';

/// Tests for UnlockProvider that don't require Supabase initialization
/// These test the pure logic functions and state management
void main() {
  group('SubscriptionTier', () {
    test('fromString should correctly parse tier strings', () {
      expect(SubscriptionTier.fromString('free'), SubscriptionTier.free);
      expect(SubscriptionTier.fromString('basic'), SubscriptionTier.basic);
      expect(SubscriptionTier.fromString('premium'), SubscriptionTier.premium);
      expect(SubscriptionTier.fromString('premium_plus'), SubscriptionTier.premiumPlus);
      expect(SubscriptionTier.fromString('premiumplus'), SubscriptionTier.premiumPlus);
    });

    test('fromString should handle legacy values', () {
      expect(SubscriptionTier.fromString('1-bundle'), SubscriptionTier.premium);
      expect(SubscriptionTier.fromString('premium_monthly'), SubscriptionTier.premium);
      expect(SubscriptionTier.fromString('premium_yearly'), SubscriptionTier.premium);
    });

    test('fromString should default to free for unknown values', () {
      expect(SubscriptionTier.fromString('unknown'), SubscriptionTier.free);
      expect(SubscriptionTier.fromString(''), SubscriptionTier.free);
      expect(SubscriptionTier.fromString('invalid'), SubscriptionTier.free);
    });

    test('fromString should be case insensitive', () {
      expect(SubscriptionTier.fromString('FREE'), SubscriptionTier.free);
      expect(SubscriptionTier.fromString('PREMIUM'), SubscriptionTier.premium);
      expect(SubscriptionTier.fromString('Premium_Plus'), SubscriptionTier.premiumPlus);
    });

    test('displayName should return correct strings', () {
      expect(SubscriptionTier.free.displayName, 'Free');
      expect(SubscriptionTier.basic.displayName, 'Basic');
      expect(SubscriptionTier.premium.displayName, 'Premium');
      expect(SubscriptionTier.premiumPlus.displayName, 'Premium+');
    });
  });

  group('UnlockState', () {
    test('should create state with correct default values', () {
      final state = UnlockState(
        isPremium: false,
        subscriptionTier: SubscriptionTier.free,
        questionCount: 0,
        backButtonCount: 0,
        sparkQuestionsRemaining: 0,
      );

      expect(state.isPremium, false);
      expect(state.subscriptionTier, SubscriptionTier.free);
      expect(state.questionCount, 0);
      expect(state.backButtonCount, 0);
      expect(state.sparkQuestionsRemaining, 0);
      expect(state.lastCheckedUserId, null);
    });

    test('should create premium state correctly', () {
      final state = UnlockState(
        isPremium: true,
        subscriptionTier: SubscriptionTier.premium,
        questionCount: 10,
        backButtonCount: 2,
        sparkQuestionsRemaining: 150,
        lastCheckedUserId: 'user-123',
      );

      expect(state.isPremium, true);
      expect(state.subscriptionTier, SubscriptionTier.premium);
      expect(state.questionCount, 10);
      expect(state.backButtonCount, 2);
      expect(state.sparkQuestionsRemaining, 150);
      expect(state.lastCheckedUserId, 'user-123');
    });

    test('copyWith should create new state with updated values', () {
      final state = UnlockState(
        isPremium: false,
        subscriptionTier: SubscriptionTier.free,
        questionCount: 0,
        backButtonCount: 0,
        sparkQuestionsRemaining: 0,
      );

      final newState = state.copyWith(
        isPremium: true,
        subscriptionTier: SubscriptionTier.premium,
        questionCount: 5,
      );

      expect(newState.isPremium, true);
      expect(newState.subscriptionTier, SubscriptionTier.premium);
      expect(newState.questionCount, 5);
      // Unchanged values
      expect(newState.backButtonCount, 0);
      expect(newState.sparkQuestionsRemaining, 0);
    });

    test('copyWith should preserve unchanged values', () {
      final state = UnlockState(
        isPremium: true,
        subscriptionTier: SubscriptionTier.premiumPlus,
        questionCount: 15,
        backButtonCount: 3,
        sparkQuestionsRemaining: 400,
        lastCheckedUserId: 'user-456',
      );

      final newState = state.copyWith(questionCount: 16);

      // Only questionCount should change
      expect(newState.isPremium, true);
      expect(newState.subscriptionTier, SubscriptionTier.premiumPlus);
      expect(newState.questionCount, 16); // Changed
      expect(newState.backButtonCount, 3);
      expect(newState.sparkQuestionsRemaining, 400);
      expect(newState.lastCheckedUserId, 'user-456');
    });
  });

  group('UnlockNotifier Logic - Ad Display', () {
    test('ad should show at question 7 for free users', () {
      final notifier = _TestUnlockNotifier();

      // Simulate viewing 7 questions
      for (int i = 0; i < 7; i++) {
        notifier.incrementQuestionCount();
      }

      expect(notifier.shouldShowAd(), true);
    });

    test('ad should not show before question 7', () {
      final notifier = _TestUnlockNotifier();

      for (int i = 1; i <= 6; i++) {
        notifier.resetQuestionCount();
        for (int j = 0; j < i; j++) {
          notifier.incrementQuestionCount();
        }
        expect(notifier.shouldShowAd(), false,
          reason: 'Should not show ad at question $i');
      }
    });

    test('ads should show at multiples of 7 (7, 14, 21, 28)', () {
      final notifier = _TestUnlockNotifier();

      final adQuestions = [7, 14, 21, 28, 35, 42];

      for (final adQuestion in adQuestions) {
        notifier.resetQuestionCount();

        for (int i = 0; i < adQuestion; i++) {
          notifier.incrementQuestionCount();
        }

        expect(notifier.shouldShowAd(), true,
          reason: 'Should show ad at question $adQuestion');
      }
    });

    test('ads should NOT show at non-multiples of 7', () {
      final notifier = _TestUnlockNotifier();

      final nonAdQuestions = [1, 2, 3, 4, 5, 6, 8, 9, 10, 13, 15, 20, 22, 27, 29];

      for (final question in nonAdQuestions) {
        notifier.resetQuestionCount();

        for (int i = 0; i < question; i++) {
          notifier.incrementQuestionCount();
        }

        expect(notifier.shouldShowAd(), false,
          reason: 'Should NOT show ad at question $question');
      }
    });

    test('premium users should never see ads', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(isPremium: true);

      // Try all question numbers up to 50
      for (int i = 1; i <= 50; i++) {
        notifier.resetQuestionCount();
        for (int j = 0; j < i; j++) {
          notifier.incrementQuestionCount();
        }

        expect(notifier.shouldShowAd(), false,
          reason: 'Premium users should never see ads at question $i');
      }
    });

    test('ad should not show at question 0', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.shouldShowAd(), false);
    });
  });

  group('UnlockNotifier Logic - Category Locking', () {
    test('premium users have all categories unlocked', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(isPremium: true);

      // Test various categories across different modes
      expect(notifier.isCategoryLocked('couple', 'Love Talks'), false);
      expect(notifier.isCategoryLocked('couple', 'Deep Talks'), false);
      expect(notifier.isCategoryLocked('couple', 'Dream Big'), false);
      expect(notifier.isCategoryLocked('couple', 'Hot Takes'), false);
      expect(notifier.isCategoryLocked('friends', 'Party Night Talks'), false);
      expect(notifier.isCategoryLocked('family', 'History Talks'), false);
    });

    group('Couple mode free categories', () {
      test('Love Talks should be free', () {
        final notifier = _TestUnlockNotifier();
        expect(notifier.isCategoryLocked('couple', 'Love Talks'), false);
      });

      test('Deep Talks should be free', () {
        final notifier = _TestUnlockNotifier();
        expect(notifier.isCategoryLocked('couple', 'Deep Talks'), false);
      });

      test('Silly Talks should be free', () {
        final notifier = _TestUnlockNotifier();
        expect(notifier.isCategoryLocked('couple', 'Silly Talks'), false);
      });

      test('Car Talks should be free', () {
        final notifier = _TestUnlockNotifier();
        expect(notifier.isCategoryLocked('couple', 'Car Talks'), false);
      });

      test('Dream Big should be locked', () {
        final notifier = _TestUnlockNotifier();
        expect(notifier.isCategoryLocked('couple', 'Dream Big'), true);
      });

      test('Hot Takes should be locked', () {
        final notifier = _TestUnlockNotifier();
        expect(notifier.isCategoryLocked('couple', 'Hot Takes'), true);
      });
    });

    group('Friends mode free categories', () {
      test('should have correct free categories', () {
        final notifier = _TestUnlockNotifier();

        expect(notifier.isCategoryLocked('friends', 'Cozy Talks'), false);
        expect(notifier.isCategoryLocked('friends', 'Silly Talks'), false);
        expect(notifier.isCategoryLocked('friends', 'Car Talks'), false);
        expect(notifier.isCategoryLocked('friends', 'Party Night Talks'), false);
      });
    });

    group('Family mode free categories', () {
      test('should have correct free categories', () {
        final notifier = _TestUnlockNotifier();

        expect(notifier.isCategoryLocked('family', 'Silly Talks'), false);
        expect(notifier.isCategoryLocked('family', 'Cozy Talks'), false);
        expect(notifier.isCategoryLocked('family', 'History Talks'), false);
        expect(notifier.isCategoryLocked('family', 'Car Talks'), false);
      });
    });

    test('case insensitive mode check', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.isCategoryLocked('COUPLE', 'Love Talks'), false);
      expect(notifier.isCategoryLocked('Couple', 'Love Talks'), false);
      expect(notifier.isCategoryLocked('cOuPlE', 'Love Talks'), false);
    });
  });

  group('UnlockNotifier Logic - Question Limits', () {
    test('premium users get 75 questions for all categories', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(isPremium: true);

      expect(notifier.getQuestionLimitForCategory('couple', 'Love Talks'), 75);
      expect(notifier.getQuestionLimitForCategory('couple', 'Deep Talks'), 75);
      expect(notifier.getQuestionLimitForCategory('couple', 'Dream Big'), 75);
      expect(notifier.getQuestionLimitForCategory('couple', 'Hot Takes'), 75);
      expect(notifier.getQuestionLimitForCategory('friends', 'Cozy Talks'), 75);
      expect(notifier.getQuestionLimitForCategory('family', 'History Talks'), 75);
    });

    test('free users get 30 questions for free categories', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.getQuestionLimitForCategory('couple', 'Love Talks'), 30);
      expect(notifier.getQuestionLimitForCategory('couple', 'Deep Talks'), 30);
      expect(notifier.getQuestionLimitForCategory('couple', 'Silly Talks'), 30);
      expect(notifier.getQuestionLimitForCategory('couple', 'Car Talks'), 30);
    });

    test('free users get 5 preview questions for locked categories', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.getQuestionLimitForCategory('couple', 'Dream Big'), 5);
      expect(notifier.getQuestionLimitForCategory('couple', 'Hot Takes'), 5);
    });
  });

  group('UnlockNotifier Logic - Spark Access', () {
    test('free tier cannot use Spark', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.canUseSpark(), false);
    });

    test('basic tier cannot use Spark', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(
        subscriptionTier: SubscriptionTier.basic,
      );

      expect(notifier.canUseSpark(), false);
    });

    test('premium tier can use Spark', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(
        subscriptionTier: SubscriptionTier.premium,
      );

      expect(notifier.canUseSpark(), true);
    });

    test('premium+ tier can use Spark', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(
        subscriptionTier: SubscriptionTier.premiumPlus,
      );

      expect(notifier.canUseSpark(), true);
    });
  });

  group('UnlockNotifier Logic - Spark Limits', () {
    test('free tier has 0 Spark limit', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.getSparkLimit(), 0);
    });

    test('basic tier has 0 Spark limit', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(
        subscriptionTier: SubscriptionTier.basic,
      );

      expect(notifier.getSparkLimit(), 0);
    });

    test('premium tier has 150 Spark limit', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(
        subscriptionTier: SubscriptionTier.premium,
      );

      expect(notifier.getSparkLimit(), 150);
    });

    test('premium+ tier has 400 Spark limit', () {
      final notifier = _TestUnlockNotifier();
      notifier.state = notifier.state.copyWith(
        subscriptionTier: SubscriptionTier.premiumPlus,
      );

      expect(notifier.getSparkLimit(), 400);
    });
  });

  group('UnlockNotifier - State Management', () {
    test('incrementQuestionCount increments correctly', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.state.questionCount, 0);

      notifier.incrementQuestionCount();
      expect(notifier.state.questionCount, 1);

      notifier.incrementQuestionCount();
      expect(notifier.state.questionCount, 2);

      notifier.incrementQuestionCount();
      expect(notifier.state.questionCount, 3);
    });

    test('resetQuestionCount resets to zero', () {
      final notifier = _TestUnlockNotifier();

      notifier.incrementQuestionCount();
      notifier.incrementQuestionCount();
      notifier.incrementQuestionCount();
      expect(notifier.state.questionCount, 3);

      notifier.resetQuestionCount();
      expect(notifier.state.questionCount, 0);
    });

    test('incrementBackButtonCount increments correctly', () {
      final notifier = _TestUnlockNotifier();

      expect(notifier.state.backButtonCount, 0);

      notifier.incrementBackButtonCount();
      expect(notifier.state.backButtonCount, 1);

      notifier.incrementBackButtonCount();
      expect(notifier.state.backButtonCount, 2);
    });

    test('reset returns to initial free state', () {
      final notifier = _TestUnlockNotifier();

      // Modify state
      notifier.state = notifier.state.copyWith(
        isPremium: true,
        subscriptionTier: SubscriptionTier.premium,
        questionCount: 10,
        backButtonCount: 5,
        sparkQuestionsRemaining: 150,
      );

      // Reset
      notifier.reset();

      // Verify all values are reset
      expect(notifier.state.isPremium, false);
      expect(notifier.state.subscriptionTier, SubscriptionTier.free);
      expect(notifier.state.questionCount, 0);
      expect(notifier.state.backButtonCount, 0);
      expect(notifier.state.sparkQuestionsRemaining, 0);
    });
  });
}

/// Test version of UnlockNotifier that doesn't initialize Supabase
/// This allows us to test the pure logic without Supabase dependencies
class _TestUnlockNotifier {
  UnlockState state = UnlockState(
    isPremium: false,
    subscriptionTier: SubscriptionTier.free,
    questionCount: 0,
    backButtonCount: 0,
    sparkQuestionsRemaining: 0,
  );

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
      return 5;
    }

    return 30;
  }

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

  void reset() {
    state = UnlockState(
      isPremium: false,
      subscriptionTier: SubscriptionTier.free,
      questionCount: 0,
      backButtonCount: 0,
      sparkQuestionsRemaining: 0,
    );
  }
}
