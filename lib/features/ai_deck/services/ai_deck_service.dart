// lib/features/ai_deck/services/ai_deck_service.dart

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/ai_deck_model.dart';
import '../../../core/services/custom_deck_service.dart';

class AIDeckService {
  final _supabase = Supabase.instance.client;
  final _customDeckService = CustomDeckService();

  // Generate questions using the Edge Function
  Future<GenerateQuestionsResponse> generateQuestions({
    required GenerationPrompts prompts,
    int batchNumber = 1,
  }) async {
    try {
      debugPrint('Generating AI questions batch $batchNumber...');

      // Get the current session token
      final session = _supabase.auth.currentSession;
      if (session == null) {
        throw Exception('User not authenticated');
      }

      // Call the Edge Function
      final response = await _supabase.functions.invoke(
        'rapid-service',
        body: {
          'generation_prompts': prompts.toJson(),
          'batch_number': batchNumber,
        },
      );

      if (response.status != 200) {
        final error = response.data?['error'] ?? 'Failed to generate questions';
        throw Exception(error);
      }

      // Parse the response
      return GenerateQuestionsResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      debugPrint('Error generating questions: $e');
      if (e.toString().contains('Premium subscription required')) {
        throw Exception('Premium subscription required for AI deck generation');
      }
      rethrow;
    }
  }

  // Save AI generated deck to database
  Future<String> saveAIDeck({
    required String deckName,
    required GenerationPrompts prompts,
    required List<AIQuestion> questions,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      final response = await _supabase
          .from('ai_generated_decks')
          .insert({
            'user_id': userId,
            'deck_name': deckName,
            'generation_prompts': prompts.toJson(),
            'questions': questions.map((q) => q.toJson()).toList(),
          })
          .select()
          .single();

      return response['id'] as String;
    } catch (e) {
      debugPrint('Error saving AI deck: $e');
      throw Exception('Failed to save AI deck: $e');
    }
  }

  // Convert AI deck to custom deck format for playing
  Future<String> convertToCustomDeck(String aiDeckId) async {
    try {
      // Fetch the AI deck
      final aiDeckResponse = await _supabase
          .from('ai_generated_decks')
          .select()
          .eq('id', aiDeckId)
          .single();

      final aiDeck = AIGeneratedDeck.fromJson(aiDeckResponse);

      // Create a custom deck
      final customDeckId = await _customDeckService.createDeck(
        '${aiDeck.deckName} (AI)',
      );

      // Add all questions to the custom deck
      for (final question in aiDeck.questions) {
        await _customDeckService.addQuestion(customDeckId, question.question);
      }

      return customDeckId;
    } catch (e) {
      debugPrint('Error converting AI deck to custom deck: $e');
      throw Exception('Failed to convert AI deck: $e');
    }
  }

  // Get all AI decks for the current user
  Future<List<AIGeneratedDeck>> getUserAIDecks() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      final response = await _supabase
          .from('ai_generated_decks')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((deck) => AIGeneratedDeck.fromJson(deck))
          .toList();
    } catch (e) {
      debugPrint('Error fetching AI decks: $e');
      throw Exception('Failed to fetch AI decks: $e');
    }
  }

  // Get a single AI deck by ID
  Future<AIGeneratedDeck?> getAIDeck(String deckId) async {
    try {
      final response = await _supabase
          .from('ai_generated_decks')
          .select()
          .eq('id', deckId)
          .maybeSingle();

      if (response == null) return null;

      return AIGeneratedDeck.fromJson(response);
    } catch (e) {
      debugPrint('Error fetching AI deck: $e');
      return null;
    }
  }

  // Update AI deck (e.g., after reviewing questions)
  Future<void> updateAIDeck(String deckId, List<AIQuestion> questions) async {
    try {
      await _supabase
          .from('ai_generated_decks')
          .update({
            'questions': questions.map((q) => q.toJson()).toList(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', deckId);
    } catch (e) {
      debugPrint('Error updating AI deck: $e');
      throw Exception('Failed to update AI deck: $e');
    }
  }

  // Delete an AI deck
  Future<void> deleteAIDeck(String deckId) async {
    try {
      await _supabase
          .from('ai_generated_decks')
          .delete()
          .eq('id', deckId);
    } catch (e) {
      debugPrint('Error deleting AI deck: $e');
      throw Exception('Failed to delete AI deck: $e');
    }
  }

  // Check if user is premium
  Future<bool> isUserPremium() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return false;

      final response = await _supabase
          .from('user_subscriptions')
          .select('is_premium')
          .eq('user_id', userId)
          .maybeSingle();

      return response?['is_premium'] == true;
    } catch (e) {
      debugPrint('Error checking premium status: $e');
      return false;
    }
  }

  // Helper method to create a custom deck directly from prompts and kept questions
  Future<String> createCustomDeckFromQuestions({
    required String deckName,
    required List<AIQuestion> keptQuestions,
    required GenerationPrompts prompts,
  }) async {
    try {
      // First save as AI deck for record keeping
      await saveAIDeck(
        deckName: deckName,
        prompts: prompts,
        questions: keptQuestions,
      );

      // Then create custom deck for playing
      final customDeckId = await _customDeckService.createDeck(deckName);

      // Add all kept questions
      for (final question in keptQuestions) {
        await _customDeckService.addQuestion(customDeckId, question.question);
      }

      return customDeckId;
    } catch (e) {
      debugPrint('Error creating custom deck from AI questions: $e');
      throw Exception('Failed to create deck: $e');
    }
  }
}