// lib/core/services/custom_deck_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomDeckService {
  final supabase = Supabase.instance.client;

  // Get all decks for the current user
  Future<List<Map<String, dynamic>>> getUserDecks() async {
    try {
      final response = await supabase
          .from('custom_decks')
          .select('*')
          .order('created_at', ascending: false);
      
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load decks: $e');
    }
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