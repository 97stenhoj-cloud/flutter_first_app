// lib/features/spark/services/spark_service.dart

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/spark_question.dart';
import '../../../core/services/custom_deck_service.dart';

class SparkService {
  final _supabase = Supabase.instance.client;
  final _customDeckService = CustomDeckService();

  // Generate Spark questions using Edge Function
  Future<List<SparkQuestion>> generateSparkQuestions({
    required SparkGenerationParams params,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('🔥 Generating ${params.questionCount} Spark questions...');

      // Call the Edge Function via rapid-service with spark mode indicator
      final response = await _supabase.functions.invoke(
        'rapid-service',
        body: {
          'mode': 'spark',
          ...params.toJson(),
        },
      );

      if (response.status != 200) {
        final error = response.data?['error'] ?? 'Failed to generate questions';
        throw Exception(error);
      }

      // Parse the response
      final data = response.data as Map<String, dynamic>;
      final questionsJson = data['questions'] as List;

      // Save questions to database
      final List<SparkQuestion> sparkQuestions = [];
      for (final questionJson in questionsJson) {
        final question = await _saveSparkQuestion(
          question: questionJson['question'] as String,
          answer: questionJson['answer'] as String?,
          generationPrompts: params.toJson(),
        );
        sparkQuestions.add(question);
      }

      debugPrint('✅ Generated and saved ${sparkQuestions.length} Spark questions');
      return sparkQuestions;
    } catch (e) {
      debugPrint('❌ Error generating Spark questions: $e');
      rethrow;
    }
  }

  // Save a single Spark question to database
  Future<SparkQuestion> _saveSparkQuestion({
    required String question,
    String? answer,
    required Map<String, dynamic> generationPrompts,
  }) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final response = await _supabase
        .from('spark_questions')
        .insert({
          'user_id': userId,
          'question': question,
          'answer': answer,
          'generation_prompts': generationPrompts,
          'is_favorited': false,
          'expires_at': DateTime.now().add(const Duration(hours: 24)).toIso8601String(),
        })
        .select()
        .single();

    return SparkQuestion.fromJson(response);
  }

  // Get all active Spark questions for current user
  Future<List<SparkQuestion>> getUserSparkQuestions() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final response = await _supabase
          .from('spark_questions')
          .select()
          .eq('user_id', userId)
          .gte('expires_at', DateTime.now().toIso8601String())
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => SparkQuestion.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('❌ Error fetching Spark questions: $e');
      throw Exception('Failed to fetch Spark questions: $e');
    }
  }

  // Get a single Spark question by ID
  Future<SparkQuestion?> getSparkQuestion(String questionId) async {
    try {
      final response = await _supabase
          .from('spark_questions')
          .select()
          .eq('id', questionId)
          .maybeSingle();

      if (response == null) return null;

      return SparkQuestion.fromJson(response);
    } catch (e) {
      debugPrint('❌ Error fetching Spark question: $e');
      return null;
    }
  }

  // Add Spark question to Favorites deck
  Future<bool> addToFavorites(SparkQuestion question) async {
    try {
      debugPrint('❤️ Adding Spark question to Favorites...');

      // Use the existing addToFavorites method from CustomDeckService
      final added = await _customDeckService.addToFavorites(
        question.question,
        'Spark', // gameMode
        'AI Generated', // category
      );

      if (added) {
        // Mark as favorited in spark_questions table
        await _supabase
            .from('spark_questions')
            .update({'is_favorited': true})
            .eq('id', question.id);

        debugPrint('✅ Added to Favorites');
        return true;
      } else {
        debugPrint('ℹ️ Question already in Favorites');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Error adding to favorites: $e');
      throw Exception('Failed to add to favorites: $e');
    }
  }

  // Add Spark question to a specific custom deck
  Future<void> addToDeck(SparkQuestion question, String deckId) async {
    try {
      debugPrint('📁 Adding Spark question to deck $deckId...');

      // Check if question already exists in the deck (prevent duplicates)
      final existing = await _supabase
          .from('custom_questions')
          .select('id')
          .eq('deck_id', deckId)
          .eq('question_text', question.question)
          .maybeSingle();

      if (existing != null) {
        throw Exception('Question already exists in this deck');
      }

      // Add question to the custom deck
      await _customDeckService.addQuestion(deckId, question.question);

      debugPrint('✅ Added to deck');
    } catch (e) {
      debugPrint('❌ Error adding to deck: $e');
      rethrow;
    }
  }

  // Delete a Spark question
  Future<void> deleteSparkQuestion(String questionId) async {
    try {
      await _supabase
          .from('spark_questions')
          .delete()
          .eq('id', questionId);

      debugPrint('🗑️ Deleted Spark question');
    } catch (e) {
      debugPrint('❌ Error deleting Spark question: $e');
      throw Exception('Failed to delete question: $e');
    }
  }

  // Clean up expired questions (can be called periodically)
  Future<void> cleanupExpiredQuestions() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return;

      await _supabase
          .from('spark_questions')
          .delete()
          .eq('user_id', userId)
          .lt('expires_at', DateTime.now().toIso8601String());

      debugPrint('🧹 Cleaned up expired Spark questions');
    } catch (e) {
      debugPrint('❌ Error cleaning up expired questions: $e');
    }
  }

  // Get count of active Spark questions
  Future<int> getActiveQuestionCount() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return 0;

      final response = await _supabase
          .from('spark_questions')
          .select('id')
          .eq('user_id', userId)
          .gte('expires_at', DateTime.now().toIso8601String());

      return (response as List).length;
    } catch (e) {
      debugPrint('❌ Error getting active question count: $e');
      return 0;
    }
  }

  // Check if user has reached their Spark limit
  Future<bool> hasReachedLimit() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return true;

      final response = await _supabase
          .rpc('get_spark_remaining', params: {'p_user_id': userId});

      final remaining = response as int? ?? 0;
      return remaining <= 0;
    } catch (e) {
      debugPrint('❌ Error checking Spark limit: $e');
      return true; // Fail safe - assume limit reached
    }
  }

  // Get remaining Spark questions for current period
  Future<int> getRemainingQuestions() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return 0;

      final response = await _supabase
          .rpc('get_spark_remaining', params: {'p_user_id': userId});

      return response as int? ?? 0;
    } catch (e) {
      debugPrint('❌ Error getting remaining questions: $e');
      return 0;
    }
  }

  // Get Spark limit for current user
  Future<int> getSparkLimit() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return 0;

      final response = await _supabase
          .rpc('get_spark_limit', params: {'p_user_id': userId});

      return response as int? ?? 0;
    } catch (e) {
      debugPrint('❌ Error getting Spark limit: $e');
      return 0;
    }
  }
}
