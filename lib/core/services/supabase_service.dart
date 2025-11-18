import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'connectivity_service.dart';

class CachedQuestions {
  final List<String> questions;
  final DateTime cachedAt;
  final String version;

  CachedQuestions({
    required this.questions,
    required this.cachedAt,
    this.version = '1.0',
  });

  bool get isExpired => DateTime.now().difference(cachedAt).inDays >= 30;

  Map<String, dynamic> toJson() => {
        'questions': questions,
        'cachedAt': cachedAt.toIso8601String(),
        'version': version,
      };

  factory CachedQuestions.fromJson(Map<String, dynamic> json) {
    return CachedQuestions(
      questions: List<String>.from(json['questions']),
      cachedAt: DateTime.parse(json['cachedAt']),
      version: json['version'] ?? '1.0',
    );
  }
}

class SupabaseService {
  final _supabase = Supabase.instance.client;

  // Cache prefix for SharedPreferences
  static const String _cachePrefix = 'question_cache_';

  /// Fetch questions filtered by game mode and category
  /// Premium users get 30-day cache, free users get no caching
  Future<List<String>> getQuestions(
    String gameMode,
    String category,
    {String languageCode = 'en', bool? isPremium} // Default to English
  ) async {
    try {
      final cacheKey = '$_cachePrefix${gameMode.toLowerCase()}_${category}_$languageCode';

      // Check if user is premium (if not passed, check from database)
      bool userIsPremium = isPremium ?? await _checkPremiumStatus();

      // Check connectivity status
      final hasInternet = await ConnectivityService.hasInternetConnection();

      // If offline and premium, use cache (even if expired)
      if (!hasInternet && userIsPremium) {
        debugPrint('🔍 Looking for cache with key: $cacheKey');
        final cachedQuestions = await _loadFromCache(cacheKey);
        if (cachedQuestions != null) {
          debugPrint('📦 Loaded questions from cache (offline) for $gameMode/$category');
          return cachedQuestions.questions;
        }
        // No cache available - throw error
        debugPrint('❌ No cache found for key: $cacheKey');
        throw Exception('No cached data available for offline use');
      }

      // Premium users with internet: Check cache first for non-expired data
      if (userIsPremium) {
        final cachedQuestions = await _loadFromCache(cacheKey);
        if (cachedQuestions != null && !cachedQuestions.isExpired) {
          return cachedQuestions.questions;
        }
      }

      // Free users or cache miss/expired: Fetch from API
      // Map game mode to the correct column name
      String columnName = _getGameModeColumn(gameMode);

      // Fetch with translations JSONB
      final response = await _supabase
          .from('questions')
          .select('translations')  // Select JSONB column
          .eq('category_name', category)
          .eq(columnName, true);

      if (response.isEmpty) {
        return [];
      }

      // Extract text from JSONB based on language
      // Use single-pass collection for better performance
      final questions = <String>[];
      for (final item in response as List) {
        try {
          final translations = item['translations'] as Map<String, dynamic>;
          // Get the requested language, fallback to English if not found
          final translation = translations[languageCode] ?? translations['en'] ?? '';
          if (translation.isNotEmpty) {
            questions.add(translation);
          }
        } catch (e) {
          // Skip invalid items
        }
      }

      // Premium users: Save to cache
      if (userIsPremium && questions.isNotEmpty) {
        await _saveToCache(cacheKey, questions);
      }

      return questions;

    } catch (e, stackTrace) {
      debugPrint('❌ Error fetching questions: $e');
      debugPrint('📍 Stack trace: $stackTrace');

      // Try to return expired cache as fallback for premium users
      // Note: Check userIsPremium here, not isPremium parameter which might be null
      final userIsPremium = isPremium ?? await _checkPremiumStatus();
      if (userIsPremium) {
        final cacheKey = '$_cachePrefix${gameMode.toLowerCase()}_${category}_$languageCode';
        final cachedData = await _loadFromCache(cacheKey);
        if (cachedData != null) {
          debugPrint('⚠️ Using expired cache as fallback for questions');
          return cachedData.questions;
        }
      }

      rethrow;
    }
  }

  /// Check if user has premium subscription
  Future<bool> _checkPremiumStatus() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return false;

      final response = await _supabase
          .from('user_subscriptions')
          .select('is_premium')
          .eq('user_id', userId)
          .maybeSingle();

      return response?['is_premium'] ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Load questions from cache (premium only)
  Future<CachedQuestions?> _loadFromCache(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(key);
      if (jsonString == null) return null;

      final json = jsonDecode(jsonString);
      return CachedQuestions.fromJson(json);
    } catch (e) {
      debugPrint('Cache load error: $e');
      return null;
    }
  }

  /// Save questions to cache (premium only)
  Future<void> _saveToCache(String key, List<String> questions) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cached = CachedQuestions(
        questions: questions,
        cachedAt: DateTime.now(),
      );

      await prefs.setString(key, jsonEncode(cached.toJson()));
    } catch (e) {
      debugPrint('Cache save error: $e');
    }
  }

  /// Clear all cached questions (useful for manual refresh)
  Future<void> clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys = prefs.getKeys().where((key) =>
        key.startsWith(_cachePrefix) || key.startsWith('personal_deck_'));
      for (final key in keys) {
        await prefs.remove(key);
      }
      // Also clear downloaded languages list and personal deck IDs
      await prefs.remove('downloaded_languages');
      await prefs.remove('cached_personal_deck_ids');
      debugPrint('✅ Cache cleared successfully');
    } catch (e) {
      debugPrint('Cache clear error: $e');
    }
  }

  /// Get list of languages that have been downloaded for offline use
  Future<List<String>> getDownloadedLanguages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final downloaded = prefs.getStringList('downloaded_languages') ?? [];
      return downloaded;
    } catch (e) {
      debugPrint('Error getting downloaded languages: $e');
      return [];
    }
  }

  /// Mark a language as downloaded
  Future<void> _markLanguageAsDownloaded(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final downloaded = prefs.getStringList('downloaded_languages') ?? [];
      if (!downloaded.contains(languageCode)) {
        downloaded.add(languageCode);
        await prefs.setStringList('downloaded_languages', downloaded);
      }
    } catch (e) {
      debugPrint('Error marking language as downloaded: $e');
    }
  }

  /// Get all categories available for a specific game mode
  /// Premium users get 30-day cache, free users get no caching
  Future<List<String>> getCategories(String gameMode, {bool? isPremium}) async {
    try {
      final cacheKey = '${_cachePrefix}categories_${gameMode.toLowerCase()}';

      // Check if user is premium (if not passed, check from database)
      bool userIsPremium = isPremium ?? await _checkPremiumStatus();

      // Check connectivity status
      final hasInternet = await ConnectivityService.hasInternetConnection();

      // If offline and premium, use cache (even if expired)
      if (!hasInternet && userIsPremium) {
        final cachedData = await _loadFromCache(cacheKey);
        if (cachedData != null) {
          debugPrint('📦 Loaded categories from cache (offline) for $gameMode');
          return cachedData.questions; // Reusing questions field for categories
        }
        // No cache available - throw error
        throw Exception('No cached data available for offline use');
      }

      // Premium users with internet: Check cache first for non-expired data
      if (userIsPremium) {
        final cachedData = await _loadFromCache(cacheKey);
        if (cachedData != null && !cachedData.isExpired) {
          debugPrint('📦 Loaded categories from cache for $gameMode');
          return cachedData.questions; // Reusing questions field for categories
        }
      }

      // Free users or cache miss/expired: Fetch from API
      String columnName = _getGameModeColumn(gameMode);

      final response = await _supabase
          .from('questions')
          .select('category_name')
          .eq(columnName, true);

      if (response.isEmpty) {
        return [];
      }

      // Get unique categories
      final categories = (response as List)
          .map((item) => item['category_name'] as String)
          .toSet()
          .toList();

      // Premium users: Save to cache
      if (userIsPremium && categories.isNotEmpty) {
        await _saveToCache(cacheKey, categories);
        debugPrint('💾 Saved categories to cache for $gameMode');
      }

      return categories;

    } catch (e, stackTrace) {
      debugPrint('❌ Error fetching categories: $e');
      debugPrint('📍 Stack trace: $stackTrace');

      // Try to return expired cache as fallback for premium users
      // Note: Check userIsPremium here, not isPremium parameter which might be null
      final userIsPremium = isPremium ?? await _checkPremiumStatus();
      if (userIsPremium) {
        final cacheKey = '${_cachePrefix}categories_${gameMode.toLowerCase()}';
        final cachedData = await _loadFromCache(cacheKey);
        if (cachedData != null) {
          debugPrint('⚠️ Using expired cache as fallback for categories');
          return cachedData.questions;
        }
      }

      rethrow;
    }
  }

  /// Pre-cache all categories and questions for all game modes (premium only)
  /// This allows full offline functionality
  Future<void> preCacheAllContent({String languageCode = 'en'}) async {
    try {
      debugPrint('🚀 Starting pre-cache for language: $languageCode');

      // Pre-cache images first
      debugPrint('📸 Pre-caching images...');
      await _preCacheImages();
      debugPrint('  ✅ Images cached');

      final gameModes = ['Couple', 'Friends', 'Family'];
      int totalCached = 0;

      for (final gameMode in gameModes) {
        debugPrint('📦 Caching $gameMode mode...');

        // Force fetch categories from API and cache them
        final categories = await _fetchAndCacheCategories(gameMode);
        debugPrint('  ✅ Fetched and cached ${categories.length} categories for $gameMode');

        // Force fetch questions for each category from API and cache them
        for (final category in categories) {
          final questions = await _fetchAndCacheQuestions(
            gameMode,
            category,
            languageCode,
          );
          debugPrint('    ✅ Fetched and cached ${questions.length} questions for $category');
          totalCached += questions.length;
        }
      }

      // Cache personal/custom decks
      debugPrint('📝 Caching personal decks...');
      final userId = _supabase.auth.currentUser?.id;
      if (userId != null) {
        try {
          final personalDecksCount = await _cachePersonalDecks(userId);
          debugPrint('  ✅ Cached $personalDecksCount personal decks');
        } catch (e) {
          debugPrint('  ⚠️ Could not cache personal decks: $e');
        }
      }

      // Mark this language as downloaded
      await _markLanguageAsDownloaded(languageCode);

      debugPrint('🎉 Pre-cache complete! Cached $totalCached questions across all modes');
    } catch (e, stackTrace) {
      debugPrint('❌ Error during pre-cache: $e');
      debugPrint('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Force fetch categories from API and save to cache (used by preCacheAllContent)
  /// Bypasses cache-first logic to ensure fresh data is downloaded
  Future<List<String>> _fetchAndCacheCategories(String gameMode) async {
    String columnName = _getGameModeColumn(gameMode);

    final response = await _supabase
        .from('questions')
        .select('category_name')
        .eq(columnName, true);

    if (response.isEmpty) {
      return [];
    }

    // Get unique categories
    final categories = (response as List)
        .map((item) => item['category_name'] as String)
        .toSet()
        .toList();

    // Save to cache
    if (categories.isNotEmpty) {
      final cacheKey = '${_cachePrefix}categories_${gameMode.toLowerCase()}';
      await _saveToCache(cacheKey, categories);
    }

    return categories;
  }

  /// Force fetch questions from API and save to cache (used by preCacheAllContent)
  /// Bypasses cache-first logic to ensure fresh data is downloaded
  Future<List<String>> _fetchAndCacheQuestions(
    String gameMode,
    String category,
    String languageCode,
  ) async {
    // Map game mode to the correct column name
    String columnName = _getGameModeColumn(gameMode);

    // Fetch with translations JSONB
    final response = await _supabase
        .from('questions')
        .select('translations')  // Select JSONB column
        .eq('category_name', category)
        .eq(columnName, true);

    if (response.isEmpty) {
      return [];
    }

    // Extract text from JSONB based on language
    final questions = <String>[];
    for (final item in response as List) {
      try {
        final translations = item['translations'] as Map<String, dynamic>;
        // Get the requested language, fallback to English if not found
        final translation = translations[languageCode] ?? translations['en'] ?? '';
        if (translation.isNotEmpty) {
          questions.add(translation);
        }
      } catch (e) {
        // Skip invalid items
      }
    }

    // Save to cache
    if (questions.isNotEmpty) {
      final cacheKey = '$_cachePrefix${gameMode.toLowerCase()}_${category}_$languageCode';
      debugPrint('💾 Saving to cache with key: $cacheKey (${questions.length} questions)');
      await _saveToCache(cacheKey, questions);
    }

    return questions;
  }

  /// Cache personal/custom decks for offline use
  Future<int> _cachePersonalDecks(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Fetch user's custom decks
      final decksResponse = await _supabase
          .from('custom_decks')
          .select('id, deck_name')
          .eq('user_id', userId);

      final decks = decksResponse as List;

      for (final deck in decks) {
        final deckId = deck['id'];
        final deckName = deck['deck_name'];

        // Fetch questions for this deck
        final questionsResponse = await _supabase
            .from('custom_questions')
            .select('question_text')
            .eq('deck_id', deckId)
            .order('created_at', ascending: true);

        final questions = (questionsResponse as List)
            .map((q) => q['question_text'] as String)
            .toList();

        // Cache the deck and its questions
        final cacheKey = 'personal_deck_$deckId';

        final cached = {
          'deck_id': deckId,
          'deck_name': deckName,
          'questions': questions,
          'cached_at': DateTime.now().toIso8601String(),
        };

        await prefs.setString(cacheKey, jsonEncode(cached));

        debugPrint('    ✅ Cached deck "$deckName" with ${questions.length} questions');
      }

      // Save list of cached deck IDs
      final deckIds = decks.map((d) => d['id'] as String).toList();
      await prefs.setStringList('cached_personal_deck_ids', deckIds);

      return decks.length;
    } catch (e) {
      debugPrint('Error caching personal decks: $e');
      rethrow;
    }
  }

  /// Get cached personal decks for offline use
  Future<List<Map<String, dynamic>>> getCachedPersonalDecks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final deckIds = prefs.getStringList('cached_personal_deck_ids') ?? [];

      final List<Map<String, dynamic>> decks = [];

      for (final deckId in deckIds) {
        final cacheKey = 'personal_deck_$deckId';
        final jsonString = prefs.getString(cacheKey);

        if (jsonString != null) {
          final cached = jsonDecode(jsonString);
          decks.add({
            'id': cached['deck_id'],
            'deck_name': cached['deck_name'],
            'created_at': cached['cached_at'],
          });
        }
      }

      return decks;
    } catch (e) {
      debugPrint('Error loading cached personal decks: $e');
      return [];
    }
  }

  /// Get questions for a cached personal deck
  Future<List<String>> getCachedPersonalDeckQuestions(String deckId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheKey = 'personal_deck_$deckId';
      final jsonString = prefs.getString(cacheKey);

      if (jsonString != null) {
        final cached = jsonDecode(jsonString);
        return List<String>.from(cached['questions']);
      }

      return [];
    } catch (e) {
      debugPrint('Error loading cached deck questions: $e');
      return [];
    }
  }

  /// Pre-cache all images used in the app
  Future<void> _preCacheImages() async {
    final imageUrls = [
      // App Logo
      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/AppIcon/AppIcon.png',
      // TechyKoala Logo
      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/AppIcon/techykoalaIcon.png',
      // Category images
      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
    ];

    for (final url in imageUrls) {
      try {
        await DefaultCacheManager().downloadFile(url);
        debugPrint('  ✅ Cached image: $url');
      } catch (e) {
        debugPrint('⚠️ Failed to cache image: $url - $e');
      }
    }
  }

  /// Convert game mode name to database column name
  String _getGameModeColumn(String gameMode) {
    switch (gameMode.toLowerCase()) {
      case 'couple':
        return 'is_couple';
      case 'friends':
        return 'is_friends';
      case 'family':
        return 'is_family';
      default:
        return 'is_couple';
    }
  }
}