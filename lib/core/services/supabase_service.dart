import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;

  /// Fetch questions filtered by game mode and category
  /// Now extracts text from JSONB translations based on language
  Future<List<String>> getQuestions(
    String gameMode, 
    String category,
    {String languageCode = 'da'} // Default to English
  ) async {
    try {
      debugPrint('🔍 Fetching questions');
      debugPrint('   Game Mode: $gameMode');
      debugPrint('   Category: $category');
      debugPrint('   Language: $languageCode');
      
      // Map game mode to the correct column name
      String columnName = _getGameModeColumn(gameMode);
      
      // Fetch with translations JSONB
      final response = await _supabase
          .from('questions')
          .select('translations')  // Select JSONB column
          .eq('category_name', category)
          .eq(columnName, true);
      
      debugPrint('✅ Raw response: $response');
      
      if (response.isEmpty) {
        debugPrint('⚠️ No questions found for $gameMode - $category');
        return [];
      }
      
      // Extract text from JSONB based on language
      final questions = (response as List)
          .map((item) {
            final translations = item['translations'] as Map<String, dynamic>;
            // Get the requested language, fallback to English if not found
            return (translations[languageCode] ?? translations['da'] ?? '') as String;
          })
          .where((text) => text.isNotEmpty) // Filter out empty strings
          .toList();
      
      debugPrint('✅ Successfully loaded ${questions.length} questions in $languageCode');
      return questions;
      
    } catch (e, stackTrace) {
      debugPrint('❌ Error fetching questions: $e');
      debugPrint('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Get all categories available for a specific game mode
  Future<List<String>> getCategories(String gameMode) async {
    try {
      debugPrint('🔍 Fetching categories for: $gameMode');
      
      String columnName = _getGameModeColumn(gameMode);
      
      final response = await _supabase
          .from('questions')
          .select('category_name')
          .eq(columnName, true);
      
      if (response.isEmpty) {
        debugPrint('⚠️ No categories found');
        return [];
      }
      
      // Get unique categories
      final categories = (response as List)
          .map((item) => item['category_name'] as String)
          .toSet()
          .toList();
      
      debugPrint('✅ Found ${categories.length} categories');
      return categories;
      
    } catch (e, stackTrace) {
      debugPrint('❌ Error fetching categories: $e');
      debugPrint('📍 Stack trace: $stackTrace');
      rethrow;
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
        debugPrint('⚠️ Unknown game mode: $gameMode, defaulting to is_couple');
        return 'is_couple';
    }
  }
}