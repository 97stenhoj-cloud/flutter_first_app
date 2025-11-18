import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnalyticsService {
  final _supabase = Supabase.instance.client;

  // Session tracking
  String? _currentSessionId;
  DateTime? _sessionStartTime;
  DateTime? _currentQuestionStartTime;

  /// Start a new analytics session
  Future<void> startSession({
    required String gameMode,
    required String category,
    required String languageCode,
    required bool isPremium,
  }) async {
    try {
      _sessionStartTime = DateTime.now();

      final response = await _supabase.from('session_analytics').insert({
        'user_id': _supabase.auth.currentUser?.id,
        'session_started': _sessionStartTime!.toIso8601String(),
        'game_mode': gameMode,
        'category': category,
        'language': languageCode,
        'is_premium': isPremium,
        'questions_viewed': 0,
        'questions_completed': 0,
      }).select().single();

      _currentSessionId = response['id'];
    } catch (e) {
      // Silently fail - don't interrupt game for analytics
      debugPrint('Analytics error (session start): $e');
    }
  }

  /// End the current session
  Future<void> endSession({
    required int questionsViewed,
    required int questionsCompleted,
  }) async {
    if (_currentSessionId == null || _sessionStartTime == null) return;

    try {
      final sessionDuration = DateTime.now().difference(_sessionStartTime!);

      await _supabase.from('session_analytics').update({
        'session_ended': DateTime.now().toIso8601String(),
        'session_duration_seconds': sessionDuration.inSeconds,
        'questions_viewed': questionsViewed,
        'questions_completed': questionsCompleted,
      }).eq('id', _currentSessionId!);

      _currentSessionId = null;
      _sessionStartTime = null;
    } catch (e) {
      debugPrint('Analytics error (session end): $e');
    }
  }

  /// Track when a question is shown
  void startQuestionView(String question) {
    _currentQuestionStartTime = DateTime.now();
  }

  /// Track question interaction
  Future<void> trackQuestionInteraction({
    required String question,
    required bool wasSkipped,
    required bool wasFavorited,
    String? reaction,
  }) async {
    if (_currentSessionId == null || _currentQuestionStartTime == null) return;

    try {
      final timeSpent = DateTime.now().difference(_currentQuestionStartTime!);

      await _supabase.from('question_analytics').insert({
        'session_id': _currentSessionId,
        'question_text': question.length > 200 ? question.substring(0, 200) : question,
        'time_spent_seconds': timeSpent.inSeconds,
        'was_skipped': wasSkipped,
        'was_favorited': wasFavorited,
        'reaction_type': reaction,
        'timestamp': DateTime.now().toIso8601String(),
      });

      // Update category usage stats
      await _updateCategoryUsage();
    } catch (e) {
      debugPrint('Analytics error (question track): $e');
    }
  }

  /// Update category usage statistics
  Future<void> _updateCategoryUsage() async {
    // This would be better as a database trigger/function
    // but implementing client-side for now
    try {
      if (_currentSessionId == null) return;

      // Get session details
      final session = await _supabase
          .from('session_analytics')
          .select('category, game_mode')
          .eq('id', _currentSessionId!)
          .single();

      // Update or insert category usage
      await _supabase.rpc('increment_category_usage', params: {
        'p_category': session['category'],
        'p_game_mode': session['game_mode'],
      });
    } catch (e) {
      debugPrint('Analytics error (category update): $e');
    }
  }

  /// Get analytics summary (for future dashboard)
  Future<Map<String, dynamic>> getAnalyticsSummary() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return {};

      // Get user's session stats
      final sessions = await _supabase
          .from('session_analytics')
          .select()
          .eq('user_id', userId)
          .order('session_started', ascending: false)
          .limit(100);

      // Calculate summary
      int totalSessions = sessions.length;
      int totalQuestions = 0;
      double avgSessionTime = 0;
      Map<String, int> categoryCount = {};

      for (var session in sessions) {
        totalQuestions += (session['questions_viewed'] ?? 0) as int;
        avgSessionTime += (session['session_duration_seconds'] ?? 0) as int;

        String category = session['category'] ?? 'Unknown';
        categoryCount[category] = (categoryCount[category] ?? 0) + 1;
      }

      if (totalSessions > 0) {
        avgSessionTime = avgSessionTime / totalSessions;
      }

      return {
        'total_sessions': totalSessions,
        'total_questions': totalQuestions,
        'avg_session_seconds': avgSessionTime.round(),
        'favorite_categories': categoryCount,
      };
    } catch (e) {
      debugPrint('Analytics error (summary): $e');
      return {};
    }
  }

  /// Track custom events (for future use)
  Future<void> trackEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  }) async {
    try {
      await _supabase.from('custom_events').insert({
        'user_id': _supabase.auth.currentUser?.id,
        'event_name': eventName,
        'properties': properties,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      debugPrint('Analytics error (custom event): $e');
    }
  }
}