/// Test data fixtures and helpers for testing
class TestData {
  /// Mock questions for testing
  static const List<Map<String, dynamic>> mockQuestions = [
    {
      'id': '1',
      'question': 'What is your favorite memory together?',
      'category': 'Love Talks',
      'game_mode': 'Couple',
      'language_code': 'en',
    },
    {
      'id': '2',
      'question': 'What are you most grateful for today?',
      'category': 'Love Talks',
      'game_mode': 'Couple',
      'language_code': 'en',
    },
    {
      'id': '3',
      'question': 'What is your biggest dream for us?',
      'category': 'Deep Conversations',
      'game_mode': 'Couple',
      'language_code': 'en',
    },
  ];

  /// Generate a list of mock questions (for testing limits)
  static List<Map<String, dynamic>> generateMockQuestions(int count) {
    return List.generate(
      count,
      (index) => {
        'id': '${index + 1}',
        'question': 'Test question ${index + 1}',
        'category': 'Love Talks',
        'game_mode': 'Couple',
        'language_code': 'en',
      },
    );
  }

  /// Mock categories
  static const List<String> mockCategories = [
    'Love Talks',
    'Deep Conversations',
    'Silly Talks',
    'Dream Big',
    'Hot Takes',
  ];

  /// Mock premium user data
  static const Map<String, dynamic> mockPremiumUser = {
    'user_id': 'test-premium-user-id',
    'is_premium': true,
    'subscription_tier': 'premium',
    'premium_expires_at': null,
  };

  /// Mock free user data
  static const Map<String, dynamic> mockFreeUser = {
    'user_id': 'test-free-user-id',
    'is_premium': false,
    'subscription_tier': 'free',
    'premium_expires_at': null,
  };

  /// Mock premium+ user data
  static const Map<String, dynamic> mockPremiumPlusUser = {
    'user_id': 'test-premium-plus-user-id',
    'is_premium': true,
    'subscription_tier': 'premium_plus',
    'premium_expires_at': null,
  };

  /// Mock Pandora session
  static const Map<String, dynamic> mockPandoraSession = {
    'session_id': 'test-session-123',
    'pin': 'ABC123',
    'host_id': 'test-host-user-id',
    'category': 'Love Talks',
    'game_mode': 'Couple',
    'is_active': true,
    'created_at': '2025-01-01T00:00:00Z',
  };

  /// Mock Pandora participants
  static const List<Map<String, dynamic>> mockPandoraParticipants = [
    {
      'participant_id': 'participant-1',
      'session_id': 'test-session-123',
      'display_name': 'Alice',
      'is_host': true,
    },
    {
      'participant_id': 'participant-2',
      'session_id': 'test-session-123',
      'display_name': 'Bob',
      'is_host': false,
    },
  ];

  /// Mock Spark questions
  static const List<Map<String, dynamic>> mockSparkQuestions = [
    {
      'id': 'spark-1',
      'question': 'If you could have dinner with anyone, who would it be?',
      'user_id': 'test-premium-user-id',
      'created_at': '2025-01-01T00:00:00Z',
      'expires_at': '2025-01-02T00:00:00Z',
    },
    {
      'id': 'spark-2',
      'question': 'What would you do if you won the lottery?',
      'user_id': 'test-premium-user-id',
      'created_at': '2025-01-01T00:00:00Z',
      'expires_at': '2025-01-02T00:00:00Z',
    },
  ];

  /// Mock Spark usage
  static const Map<String, dynamic> mockSparkUsage = {
    'user_id': 'test-premium-user-id',
    'questions_generated_this_month': 5,
    'last_reset_at': '2025-01-01T00:00:00Z',
  };

  /// Mock analytics session
  static const Map<String, dynamic> mockAnalyticsSession = {
    'session_id': 'analytics-session-123',
    'user_id': 'test-user-id',
    'game_mode': 'Couple',
    'category': 'Love Talks',
    'started_at': '2025-01-01T00:00:00Z',
    'ended_at': '2025-01-01T00:30:00Z',
    'questions_viewed': 10,
  };
}
