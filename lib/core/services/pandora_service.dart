// lib/core/services/pandora_service.dart

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PandoraService {
  static final PandoraService _instance = PandoraService._internal();
  factory PandoraService() => _instance;
  PandoraService._internal();

  final SupabaseClient _supabase = Supabase.instance.client;
  
  // Store broadcast channel to reuse it
  RealtimeChannel? _broadcastChannel;
  String? _currentBroadcastSessionId;

  Future<Map<String, dynamic>> createSession({
  required int timerMinutes,
  required String hostDisplayName,
}) async {
  try {
    final userId = _supabase.auth.currentUser?.id;

    // Query premium status directly from database
    bool isPremium = false;
    if (userId != null) {
      final premiumResponse = await _supabase
          .from('user_subscriptions')
          .select('is_premium')
          .eq('user_id', userId)
          .maybeSingle();
      isPremium = premiumResponse?['is_premium'] ?? false;
    }

    // Generate unique PIN
    final pinResponse = await _supabase.rpc('generate_unique_pin');
    final pin = pinResponse as String;

    // Create session with host premium status
    final sessionResponse = await _supabase
        .from('pandora_sessions')
        .insert({
          'host_user_id': userId,
          'session_pin': pin,
          'timer_minutes': timerMinutes,
          'status': 'waiting',
          'current_question_index': 0,
          'host_is_premium': isPremium,
        })
        .select()
        .single();

    // Add host as participant with custom display name
    await addParticipant(
      sessionId: sessionResponse['id'],
      displayName: hostDisplayName,
      isHost: true,
    );

    debugPrint('✅ Pandora session created: ${sessionResponse['session_pin']} (Premium: $isPremium)');
    return sessionResponse;
  } catch (e, stackTrace) {
    debugPrint('❌ Error creating Pandora session: $e');
    debugPrint('📍 Stack trace: $stackTrace');
    rethrow;
  }
}
  Future<void> kickParticipant(String participantId) async {
  try {
    debugPrint('🚨 Kicking participant via RPC function: $participantId');
    
    await Supabase.instance.client.rpc(
      'kick_participant',
      params: {'p_participant_id': participantId},
    );
    
    debugPrint('✅ Participant kicked successfully');
    
  } catch (e) {
    debugPrint('❌ Error kicking participant: $e');
    rethrow;
  }
}
  Future<Map<String, dynamic>> joinSession({
    required String pin,
    required String displayName,
  }) async {
    try {
      debugPrint('🔍 Attempting to join session with PIN: $pin');
      
      final sessionResponse = await _supabase
          .from('pandora_sessions')
          .select()
          .eq('session_pin', pin)
          .maybeSingle();

      if (sessionResponse == null) {
        debugPrint('❌ No session found with PIN: $pin');
        throw 'Session not found';
      }

      debugPrint('📋 Session found: ${sessionResponse['id']} - Status: ${sessionResponse['status']}');
      
      final status = sessionResponse['status'];
      if (status == 'ended') {
        throw 'Session has ended';
      }
      
      if (status != 'waiting') {
        throw 'Session has already started';
      }

      // Add participant when joining
      debugPrint('👤 Adding participant: $displayName');
      await addParticipant(
        sessionId: sessionResponse['id'],
        displayName: displayName,
        isHost: false,
      );

      debugPrint('✅ Joined Pandora session: $pin');
      return sessionResponse;
    } catch (e, stackTrace) {
      debugPrint('❌ Error joining Pandora session: $e');
      debugPrint('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addParticipant({
  required String sessionId,
  required String displayName,
  bool isHost = false,
}) async {
  try {
    final userEmail = _supabase.auth.currentUser?.email;
    final userId = _supabase.auth.currentUser?.id; // ← Get user ID
    
    debugPrint('👤 Adding participant: $displayName (user_id: $userId)');
    
    final response = await _supabase
        .from('pandora_participants')
        .insert({
          'session_id': sessionId,
          'display_name': displayName,
          'user_email': userEmail,
          'user_id': userId, // ← Add user_id to insert
          'is_host': isHost,
        })
        .select()
        .single();

    debugPrint('✅ Participant added with ID: ${response['id']}');
    return response;
  } catch (e) {
    debugPrint('❌ Error adding participant: $e');
    rethrow;
  }
}

  Future<List<Map<String, dynamic>>> getParticipants(String sessionId) async {
    try {
      final response = await _supabase
          .from('pandora_participants')
          .select()
          .eq('session_id', sessionId)
          .order('joined_at');

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('❌ Error fetching participants: $e');
      rethrow;
    }
  }

  Future<void> startQuestionCollection(String sessionId, int timerMinutes) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'status': 'collecting_questions',
            'timer_minutes': timerMinutes,
            'timer_started_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Question collection started with timer: $timerMinutes minutes');
    } catch (e) {
      debugPrint('❌ Error starting question collection: $e');
      rethrow;
    }
  }

  Future<void> submitQuestion({
    required String sessionId,
    required String participantId,
    required String questionText,
    required String targetType,
    String? targetParticipantId,
  }) async {
    try {
      await _supabase.from('pandora_questions').insert({
        'session_id': sessionId,
        'participant_id': participantId,
        'question_text': questionText,
        'target_type': targetType,
        'target_participant_id': targetParticipantId,
      });

      debugPrint('✅ Question submitted');
    } catch (e) {
      debugPrint('❌ Error submitting question: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSessionQuestions(String sessionId) async {
    try {
      final response = await _supabase
          .from('pandora_questions')
          .select('''
            *,
            participant:participant_id(display_name),
            target_participant:target_participant_id(display_name)
          ''')
          .eq('session_id', sessionId)
          .order('created_at');

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('❌ Error fetching questions: $e');
      rethrow;
    }
  }

  Future<void> startPlaying(String sessionId) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'status': 'playing',
            'current_question_index': 0,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Playing phase started');
    } catch (e) {
      debugPrint('❌ Error starting playing phase: $e');
      rethrow;
    }
  }

  Future<void> initializeBroadcastChannel(String sessionId) async {
    if (_broadcastChannel == null || _currentBroadcastSessionId != sessionId) {
      debugPrint('🔧 [Host] Initializing broadcast channel: pandora_game_$sessionId');
      _broadcastChannel = _supabase.channel('pandora_game_$sessionId');
      _currentBroadcastSessionId = sessionId;
      
      // FIXED: Removed 'await' from subscribe
      _broadcastChannel!.subscribe((status, error) {
        debugPrint('📡 [Host] Channel status: $status');
        if (error != null) {
          debugPrint('❌ [Host] Channel error: $error');
        }
      });
      
      debugPrint('✅ [Host] Broadcast channel ready');
    }
  }

  // ✅ BROADCAST METHOD: Host broadcasts index changes directly to all players
  Future<void> broadcastQuestionIndex(String sessionId, int index) async {
    try {
      if (_broadcastChannel == null || _currentBroadcastSessionId != sessionId) {
        await initializeBroadcastChannel(sessionId);
      }
      
      debugPrint('📤 [Host] Broadcasting index: $index');
      
      _broadcastChannel!.sendBroadcastMessage(
        event: 'question_index',
        payload: {'index': index},
      );
      
      debugPrint('✅ [Host] Broadcast sent');
    } catch (e) {
      debugPrint('❌ [Host] Error broadcasting: $e');
    }
  }

  // ✅ BROADCAST SUBSCRIPTION: Players subscribe to receive index updates
  RealtimeChannel subscribeToGameBroadcast(
    String sessionId,
    void Function(int index) onIndexUpdate,
  ) {
    debugPrint('🔌 [Player] Subscribing to broadcast channel: pandora_game_$sessionId');
    
    final channel = _supabase.channel('pandora_game_$sessionId');
    
    channel
        .onBroadcast(
          event: 'question_index',
          callback: (payload) {
            debugPrint('📥 [Player] Broadcast received: $payload');
            final index = payload['index'] as int?;
            if (index != null) {
              debugPrint('✅ [Player] Updating to index: $index');
              onIndexUpdate(index);
            }
          },
        )
        .subscribe((status, error) {
          debugPrint('📡 [Player] Channel status: $status');
          if (error != null) {
            debugPrint('❌ [Player] Channel error: $error');
          }
        });
    
    return channel;
  }

  // ✅ DATABASE METHOD: Update the database (backup, not for real-time sync)
  Future<void> updateQuestionIndex(String sessionId, int index) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'current_question_index': index,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Question index updated in database: $index');
    } catch (e) {
      debugPrint('❌ Error updating question index: $e');
    }
  }

  Future<void> endSession(String sessionId) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'status': 'ended',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Session ended');
    } catch (e) {
      debugPrint('❌ Error ending session: $e');
      rethrow;
    }
  }

  // ADDED: Cancel session method
  Future<void> cancelSession(String sessionId) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'status': 'cancelled',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Session cancelled');
    } catch (e) {
      debugPrint('❌ Error cancelling session: $e');
      rethrow;
    }
  }

  // ============ REACTIONS ============
  
  /// Add a reaction to a question (FIXED: Each player can give their own emoji)
  Future<void> addReaction({
    required String sessionId,
    required int questionIndex,
    required String participantId,
    required String reactionType,
  }) async {
    try {
      // First, remove any existing reaction from this participant on this question
      await _supabase
          .from('pandora_reactions')
          .delete()
          .eq('session_id', sessionId)
          .eq('question_index', questionIndex)
          .eq('participant_id', participantId);
      
      // Add new reaction
      await _supabase.from('pandora_reactions').insert({
        'session_id': sessionId,
        'question_index': questionIndex,
        'participant_id': participantId,
        'reaction_type': reactionType,
      });

      debugPrint('✅ Reaction added: $reactionType');
    } catch (e) {
      debugPrint('❌ Error adding reaction: $e');
    }
  }

/// Get reactions for a specific question (REMOVED 'hundred')
  Future<Map<String, int>> getReactionsForQuestion(
    String sessionId,
    int questionIndex,
  ) async {
    try {
      final response = await _supabase
          .from('pandora_reactions')
          .select('reaction_type')
          .eq('session_id', sessionId)
          .eq('question_index', questionIndex);

      final reactions = <String, int>{
        'laugh': 0,
        'shock': 0,
        'heart': 0,
        'fire': 0,
      };

      for (final row in response) {
        final type = row['reaction_type'] as String;
        reactions[type] = (reactions[type] ?? 0) + 1;
      }

      return reactions;
    } catch (e) {
      debugPrint('❌ Error fetching reactions: $e');
      return {};
    }
  }

  /// Get the current user's reaction for a specific question
  Future<String?> getMyReaction({
    required String sessionId,
    required int questionIndex,
    required String participantId,
  }) async {
    try {
      final response = await _supabase
          .from('pandora_reactions')
          .select('reaction_type')
          .eq('session_id', sessionId)
          .eq('question_index', questionIndex)
          .eq('participant_id', participantId)
          .maybeSingle();

      if (response == null) return null;
      return response['reaction_type'] as String;
    } catch (e) {
      debugPrint('❌ Error fetching my reaction: $e');
      return null;
    }
  }

  /// Subscribe to reactions changes
  RealtimeChannel subscribeToReactions(
    String sessionId,
    void Function() onReactionsChange,
  ) {
    return _supabase
        .channel('pandora_reactions_$sessionId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'pandora_reactions',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'session_id',
            value: sessionId,
          ),
          callback: (payload) {
            debugPrint('📡 Reactions update');
            onReactionsChange();
          },
        )
        .subscribe();
  }

  /// Get session statistics (UPDATED: Added most reacted questions)
  Future<Map<String, dynamic>> getSessionStats(String sessionId) async {
    try {
      // Get total questions
      final questions = await getSessionQuestions(sessionId);
      
      // Get total participants
      final participants = await getParticipants(sessionId);
      
      // Get all reactions
      final reactionsResponse = await _supabase
          .from('pandora_reactions')
          .select('reaction_type, question_index')
          .eq('session_id', sessionId);
      
      // Count reactions by type (REMOVED 'hundred')
      final reactionCounts = <String, int>{
        'laugh': 0,
        'shock': 0,
        'heart': 0,
        'fire': 0,
      };
      
      // Count reactions per question per type
      final questionReactions = <int, Map<String, int>>{};
      
      for (final row in reactionsResponse) {
        final type = row['reaction_type'] as String;
        final questionIndex = row['question_index'] as int;
        
        reactionCounts[type] = (reactionCounts[type] ?? 0) + 1;
        
        if (!questionReactions.containsKey(questionIndex)) {
          questionReactions[questionIndex] = {
            'laugh': 0,
            'shock': 0,
            'heart': 0,
            'fire': 0,
          };
        }
        questionReactions[questionIndex]![type] = 
            (questionReactions[questionIndex]![type] ?? 0) + 1;
      }
      
      // Find most reacted question for each category
      String? mostLovedQuestion;
      int mostLovedCount = 0;
      String? mostFunnyQuestion;
      int mostFunnyCount = 0;
      String? mostShockingQuestion;
      int mostShockingCount = 0;
      String? mostLitQuestion;
      int mostLitCount = 0;
      
      questionReactions.forEach((index, reactions) {
        if (index < questions.length) {
          final question = questions[index]['question_text'] as String;
          
          if (reactions['heart']! > mostLovedCount) {
            mostLovedCount = reactions['heart']!;
            mostLovedQuestion = question;
          }
          
          if (reactions['laugh']! > mostFunnyCount) {
            mostFunnyCount = reactions['laugh']!;
            mostFunnyQuestion = question;
          }
          
          if (reactions['shock']! > mostShockingCount) {
            mostShockingCount = reactions['shock']!;
            mostShockingQuestion = question;
          }
          
          if (reactions['fire']! > mostLitCount) {
            mostLitCount = reactions['fire']!;
            mostLitQuestion = question;
          }
        }
      });
      
      // Find most questions by participant
      final questionsByParticipant = <String, int>{};
      for (final q in questions) {
        final participantId = q['participant_id'] as String;
        questionsByParticipant[participantId] = 
            (questionsByParticipant[participantId] ?? 0) + 1;
      }
      
      String? mostQuestionsById;
      int maxQuestions = 0;
      questionsByParticipant.forEach((id, count) {
        if (count > maxQuestions) {
          maxQuestions = count;
          mostQuestionsById = id;
        }
      });
      
      // Find most targeted participant
      final targetCounts = <String, int>{};
      for (final q in questions) {
        if (q['target_type'] == 'specific') {
          final targetId = q['target_participant_id'] as String?;
          if (targetId != null) {
            targetCounts[targetId] = (targetCounts[targetId] ?? 0) + 1;
          }
        }
      }
      
      String? mostTargetedId;
      int maxTargets = 0;
      targetCounts.forEach((id, count) {
        if (count > maxTargets) {
          maxTargets = count;
          mostTargetedId = id;
        }
      });
      
      return {
        'total_questions': questions.length,
        'total_participants': participants.length,
        'total_reactions': reactionsResponse.length,
        'reaction_counts': reactionCounts,
        'most_questions_by_id': mostQuestionsById,
        'most_questions_count': maxQuestions,
        'most_targeted_id': mostTargetedId,
        'most_targeted_count': maxTargets,
        'participants': participants,
        // Most reacted questions
        'most_loved_question': mostLovedQuestion,
        'most_loved_count': mostLovedCount,
        'most_funny_question': mostFunnyQuestion,
        'most_funny_count': mostFunnyCount,
        'most_shocking_question': mostShockingQuestion,
        'most_shocking_count': mostShockingCount,
        'most_lit_question': mostLitQuestion,
        'most_lit_count': mostLitCount,
      };
    } catch (e) {
      debugPrint('❌ Error fetching session stats: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getSession(String sessionId) async {
    try {
      final response = await _supabase
          .from('pandora_sessions')
          .select()
          .eq('id', sessionId)
          .maybeSingle();

      return response;
    } catch (e) {
      debugPrint('❌ Error fetching session: $e');
      rethrow;
    }
  }

  RealtimeChannel subscribeToSession(
    String sessionId,
    void Function(Map<String, dynamic>) onSessionUpdate,
  ) {
    return _supabase
        .channel('pandora_session_$sessionId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'pandora_sessions',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'id',
            value: sessionId,
          ),
          callback: (payload) {
            debugPrint('📡 Session update: ${payload.newRecord}');
            onSessionUpdate(payload.newRecord);
          },
        )
        .subscribe();
  }

  RealtimeChannel subscribeToParticipants(
    String sessionId,
    void Function() onParticipantsChange,
  ) {
    return _supabase
        .channel('pandora_participants_$sessionId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'pandora_participants',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'session_id',
            value: sessionId,
          ),
          callback: (payload) {
            debugPrint('📡 Participants update');
            onParticipantsChange();
          },
        )
        .subscribe();
  }

  RealtimeChannel subscribeToQuestions(
    String sessionId,
    void Function() onQuestionsChange,
  ) {
    return _supabase
        .channel('pandora_questions_$sessionId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'pandora_questions',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'session_id',
            value: sessionId,
          ),
          callback: (payload) {
            debugPrint('📡 Questions update');
            onQuestionsChange();
          },
        )
        .subscribe();
  }
}