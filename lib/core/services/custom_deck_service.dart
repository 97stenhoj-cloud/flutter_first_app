// lib/core/services/custom_deck_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart'; // ADDED: For debugPrint


class CustomDeckService {
  final supabase = Supabase.instance.client;
  
  // Special Favorites deck ID (consistent across all users)
  static const String favoritesDeckName = 'Favorites';

  // Get all decks for the current user (including Favorites)
  Future<List<Map<String, dynamic>>> getUserDecks() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      final response = await supabase
          .from('custom_decks')
          .select('*')
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load decks: $e');
    }
  }
Future<void> renameDeck(String deckId, String newName) async {
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId == null) throw Exception('User not authenticated');

  await Supabase.instance.client
      .from('custom_decks')
      .update({'deck_name': newName})
      .eq('id', deckId)
      .eq('user_id', userId);
}
  // Ensure Favorites deck exists for the user
  Future<String> ensureFavoritesDeck() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      // Check if Favorites deck already exists
      final existing = await supabase
      
          .from('custom_decks')
          .select('id')
          .eq('user_id', userId)
          .eq('deck_name', favoritesDeckName)
          .maybeSingle();

      if (existing != null) {
        return existing['id'] as String;
      }

      // Create Favorites deck if it doesn't exist
      final response = await supabase
          .from('custom_decks')
          .insert({
            'user_id': userId,
            'deck_name': favoritesDeckName,
            'is_favorites': true, // Mark as favorites deck
          })
          .select()
          .single();

      return response['id'] as String;
    } catch (e) {
      throw Exception('Failed to ensure favorites deck: $e');
    }
  }

  // Get Favorites deck ID
  Future<String?> getFavoritesDeckId() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) return null;

      final response = await supabase
          .from('custom_decks')
          .select('id')
          .eq('user_id', userId)
          .eq('deck_name', favoritesDeckName)
          .maybeSingle();

      return response?['id'] as String?;
    } catch (e) {
      debugPrint('Error getting favorites deck: $e');
      return null;
    }
  }

  // Add question to favorites
  Future<bool> addToFavorites(String questionText, String gameMode, String category) async {
    try {
      final favoritesDeckId = await ensureFavoritesDeck();
      
      // Check if question already exists in favorites (prevent duplicates)
      final existing = await supabase
          .from('custom_questions')
          .select('id')
          .eq('deck_id', favoritesDeckId)
          .eq('question_text', questionText)
          .maybeSingle();

      if (existing != null) {
        // Question already favorited
        return false;
      }

      // Add to favorites with metadata
      await supabase.from('custom_questions').insert({
        'deck_id': favoritesDeckId,
        'question_text': questionText,
        'source_game_mode': gameMode,
        'source_category': category,
      });

      return true;
    } catch (e) {
      throw Exception('Failed to add to favorites: $e');
    }
  }

  // Remove question from favorites
  Future<void> removeFromFavorites(String questionText) async {
    try {
      final favoritesDeckId = await getFavoritesDeckId();
      if (favoritesDeckId == null) return;

      await supabase
          .from('custom_questions')
          .delete()
          .eq('deck_id', favoritesDeckId)
          .eq('question_text', questionText);
    } catch (e) {
      throw Exception('Failed to remove from favorites: $e');
    }
  }

  // Check if question is favorited
  Future<bool> isQuestionFavorited(String questionText) async {
    try {
      final favoritesDeckId = await getFavoritesDeckId();
      if (favoritesDeckId == null) return false;

      final result = await supabase
          .from('custom_questions')
          .select('id')
          .eq('deck_id', favoritesDeckId)
          .eq('question_text', questionText)
          .maybeSingle();

      return result != null;
    } catch (e) {
      debugPrint('Error checking if favorited: $e');
      return false;
    }
  }

  // Check if deck is the Favorites deck
  bool isFavoritesDeck(Map<String, dynamic> deck) {
    return deck['deck_name'] == favoritesDeckName || deck['is_favorites'] == true;
  }

  // Create a new deck
  Future<String> createDeck(String deckName) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      final response = await supabase
          .from('custom_decks')
          .insert({
            'user_id': userId,
            'deck_name': deckName,
            'is_favorites': false,
          })
          .select()
          .single();

      return response['id'] as String;
    } catch (e) {
      throw Exception('Failed to create deck: $e');
    }
  }

  // Update deck name
  Future<void> updateDeck(String deckId, String newName) async {
    try {
      await supabase
          .from('custom_decks')
          .update({'deck_name': newName, 'updated_at': DateTime.now().toIso8601String()})
          .eq('id', deckId);
    } catch (e) {
      throw Exception('Failed to update deck: $e');
    }
  }

  // Delete a deck (will cascade delete all questions)
  Future<void> deleteDeck(String deckId) async {
    try {
      await supabase
          .from('custom_decks')
          .delete()
          .eq('id', deckId);
    } catch (e) {
      throw Exception('Failed to delete deck: $e');
    }
  }

  // Get all questions in a deck
  Future<List<Map<String, dynamic>>> getDeckQuestions(String deckId) async {
    try {
      final response = await supabase
          .from('custom_questions')
          .select('*')
          .eq('deck_id', deckId)
          .order('created_at', ascending: true);
      
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load questions: $e');
    }
  }

  // Add a question to a deck
  Future<void> addQuestion(String deckId, String questionText) async {
    try {
      await supabase
          .from('custom_questions')
          .insert({
            'deck_id': deckId,
            'question_text': questionText,
          });
    } catch (e) {
      throw Exception('Failed to add question: $e');
    }
  }

  // Update a question
  Future<void> updateQuestion(String questionId, String newText) async {
    try {
      await supabase
          .from('custom_questions')
          .update({'question_text': newText})
          .eq('id', questionId);
    } catch (e) {
      throw Exception('Failed to update question: $e');
    }
  }

  // Delete a question
  Future<void> deleteQuestion(String questionId) async {
    try {
      await supabase
          .from('custom_questions')
          .delete()
          .eq('id', questionId);
    } catch (e) {
      throw Exception('Failed to delete question: $e');
    }
  }

  // Get questions as list of strings for game play
  Future<List<String>> getQuestionsForGame(String deckId) async {
    try {
      final questions = await getDeckQuestions(deckId);
      return questions.map((q) => q['question_text'] as String).toList();
    } catch (e) {
      throw Exception('Failed to load questions for game: $e');
    }
  }
}