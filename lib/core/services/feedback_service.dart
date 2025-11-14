import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedbackService {
  final _supabase = Supabase.instance.client;

  /// Submit or update a rating for a deck (category)
Future<void> rateDeck({
  required String categoryName,
  required String gameMode,
  required int rating,
}) async {
  try {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      debugPrint('⚠️ User not authenticated');
      return;
    }

    await _supabase.from('deck_ratings').upsert(
  {
    'category_name': categoryName,
    'game_mode': gameMode,
    'user_id': userId,
    'rating': rating,
    'last_rated_at': DateTime.now().toIso8601String(), // Update timestamp
  },
  onConflict: 'category_name,game_mode,user_id',
);

    debugPrint('✅ Deck rated: $categoryName - $rating stars');
  } catch (e) {
    debugPrint('❌ Error rating deck: $e');
    rethrow;
  }
}

/// Check if user should be prompted to rate this deck
/// Returns true if: never rated OR last rated more than 30 days ago
Future<bool> shouldPromptRating({
  required String categoryName,
  required String gameMode,
}) async {
  try {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final response = await _supabase
        .from('deck_ratings')
        .select('last_rated_at')
        .eq('category_name', categoryName)
        .eq('game_mode', gameMode)
        .eq('user_id', userId)
        .maybeSingle();

    // Never rated - should prompt
    if (response == null) {
      debugPrint('📊 Never rated "$categoryName" - should prompt');
      return true;
    }

    // Check if more than 30 days since last rating
    final lastRatedAt = DateTime.parse(response['last_rated_at'] as String);
    final daysSinceRating = DateTime.now().difference(lastRatedAt).inDays;
    
    final shouldPrompt = daysSinceRating >= 30;
    debugPrint('📊 Last rated "$categoryName" $daysSinceRating days ago - should prompt: $shouldPrompt');
    
    return shouldPrompt;
  } catch (e) {
    debugPrint('❌ Error checking rating prompt: $e');
    return false;
  }
}

  /// Get average rating for a deck
  Future<double?> getDeckRating({
    required String categoryName,
    required String gameMode,
  }) async {
    try {
      final response = await _supabase
          .from('deck_ratings')
          .select('rating')
          .eq('category_name', categoryName)
          .eq('game_mode', gameMode);

      if (response.isEmpty) return null;

      final ratings = (response as List).map((r) => r['rating'] as int).toList();
      final average = ratings.reduce((a, b) => a + b) / ratings.length;
      
      return average;
    } catch (e) {
      debugPrint('❌ Error fetching deck rating: $e');
      return null;
    }
  }

  /// Get user's rating for a deck
  Future<int?> getMyDeckRating({
    required String categoryName,
    required String gameMode,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return null;

      final response = await _supabase
          .from('deck_ratings')
          .select('rating')
          .eq('category_name', categoryName)
          .eq('game_mode', gameMode)
          .eq('user_id', userId)
          .maybeSingle();

      if (response == null) return null;
      return response['rating'] as int;
    } catch (e) {
      debugPrint('❌ Error fetching my deck rating: $e');
      return null;
    }
  }

  /// Submit or update a rating for a specific question
  Future<void> rateQuestion({
    required String questionId,
    required int rating,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        debugPrint('⚠️ User not authenticated');
        return;
      }

      await _supabase.from('question_ratings').upsert({
        'question_id': questionId,
        'user_id': userId,
        'rating': rating,
      });

      debugPrint('✅ Question rated: $questionId - $rating stars');
    } catch (e) {
      debugPrint('❌ Error rating question: $e');
      rethrow;
    }
  }

  /// Get statistics for your feedback (admin view)
  Future<Map<String, dynamic>> getFeedbackStats() async {
    try {
      // Get deck ratings stats
      final deckStats = await _supabase
          .from('deck_ratings')
          .select('category_name, game_mode, rating');

      // Get question ratings stats
      final questionStats = await _supabase
          .from('question_ratings')
          .select('rating');

      // Calculate averages by deck
      final Map<String, List<int>> deckRatings = {};
      for (final row in deckStats) {
        final key = '${row['game_mode']}_${row['category_name']}';
        if (!deckRatings.containsKey(key)) {
          deckRatings[key] = [];
        }
        deckRatings[key]!.add(row['rating'] as int);
      }

      final deckAverages = <String, double>{};
      deckRatings.forEach((key, ratings) {
        deckAverages[key] = ratings.reduce((a, b) => a + b) / ratings.length;
      });

      return {
        'total_deck_ratings': deckStats.length,
        'total_question_ratings': questionStats.length,
        'deck_averages': deckAverages,
      };
    } catch (e) {
      debugPrint('❌ Error fetching feedback stats: $e');
      rethrow;
    }
  }
}