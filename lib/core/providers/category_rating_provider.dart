// lib/core/providers/category_rating_provider.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/feedback_service.dart';

/// State for category ratings
class CategoryRatingState {
  final Map<String, int?> ratings; // Key: "gameMode_categoryName", Value: rating
  final bool isLoading;

  CategoryRatingState({
    required this.ratings,
    this.isLoading = false,
  });

  CategoryRatingState copyWith({
    Map<String, int?>? ratings,
    bool? isLoading,
  }) {
    return CategoryRatingState(
      ratings: ratings ?? this.ratings,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier for managing category ratings
class CategoryRatingNotifier extends StateNotifier<CategoryRatingState> {
  final FeedbackService _feedbackService = FeedbackService();

  CategoryRatingNotifier() : super(CategoryRatingState(ratings: {}));

  /// Load ratings for a specific game mode
  Future<void> loadRatingsForMode(String gameMode, List<String> categories) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    try {
      final Map<String, int?> newRatings = {};

      for (final category in categories) {
        final key = '${gameMode}_$category';

        // Skip if already cached
        if (state.ratings.containsKey(key)) {
          newRatings[key] = state.ratings[key];
          continue;
        }

        // Fetch from database
        final rating = await _feedbackService.getMyDeckRating(
          categoryName: category,
          gameMode: gameMode,
        );
        newRatings[key] = rating;
      }

      state = state.copyWith(
        ratings: {...state.ratings, ...newRatings},
        isLoading: false,
      );

      debugPrint('✅ Loaded ratings for $gameMode: ${newRatings.length} categories');
    } catch (e) {
      debugPrint('❌ Error loading ratings: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  /// Get rating for a specific category
  int? getRating(String gameMode, String category) {
    final key = '${gameMode}_$category';
    return state.ratings[key];
  }

  /// Update rating for a category
  void updateRating(String gameMode, String category, int? rating) {
    final key = '${gameMode}_$category';
    final updatedRatings = Map<String, int?>.from(state.ratings);
    updatedRatings[key] = rating;

    state = state.copyWith(ratings: updatedRatings);
    debugPrint('✅ Updated rating for $key: $rating');
  }

  /// Clear all cached ratings
  void clearCache() {
    state = CategoryRatingState(ratings: {});
    debugPrint('🗑️ Category ratings cache cleared');
  }
}

/// Provider for category ratings
final categoryRatingProvider = StateNotifierProvider<CategoryRatingNotifier, CategoryRatingState>((ref) {
  return CategoryRatingNotifier();
});
