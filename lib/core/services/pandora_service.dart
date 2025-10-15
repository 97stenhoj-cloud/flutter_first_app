// lib/core/services/pandora_service.dart
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PandoraService {
  final _supabase = Supabase.instance.client;

  /// Create a new Pandora session
  Future<Map<String, dynamic>> createSession({
    required int timerMinutes,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      
      // Generate unique PIN
      final pinResponse = await _supabase.rpc('generate_unique_pin');
      final pin = pinResponse as String;
      
      // Create session
      final sessionResponse = await _supabase
          .from('pandora_sessions')
          .insert({
            'host_user_id': userId,
            'session_pin': pin,
            'timer_minutes': timerMinutes,
            'status': 'waiting',
          })
          .select()
          .single();

      // Add host as participant
      final hostEmail = _supabase.auth.currentUser?.email ?? 'Host';
      await addParticipant(
        sessionId: sessionResponse['id'],
        displayName: hostEmail,
        isHost: true,
      );

      debugPrint('✅ Pandora session created: ${sessionResponse['session_pin']}');
      return sessionResponse;
    } catch (e, stackTrace) {
      debugPrint('❌ Error creating Pandora session: $e');
      debugPrint('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Join a session with PIN
  Future<Map<String, dynamic>> joinSession({
    required String pin,
    required String displayName,
  }) async {
    try {
      // Find session by PIN
      final sessionResponse = await _supabase
          .from('pandora_sessions')
          .select()
          .eq('session_pin', pin)
          .maybeSingle();

      if (sessionResponse == null) {
        throw Exception('Session not found with PIN: $pin');
      }

      if (sessionResponse['status'] == 'ended') {
        throw Exception('This session has ended');
      }

      // Add participant
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

  /// Add a participant to a session
  Future<Map<String, dynamic>> addParticipant({
    required String sessionId,
    required String displayName,
    bool isHost = false,
  }) async {
    try {
      final userEmail = _supabase.auth.currentUser?.email;
      
      final response = await _supabase
          .from('pandora_participants')
          .insert({
            'session_id': sessionId,
            'display_name': displayName,
            'user_email': userEmail,
            'is_host': isHost,
          })
          .select()
          .single();

      return response;
    } catch (e) {
      debugPrint('❌ Error adding participant: $e');
      rethrow;
    }
  }

  /// Get all participants in a session
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

  /// Start question collection phase
  Future<void> startQuestionCollection(String sessionId) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'status': 'collecting_questions',
            'timer_started_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Question collection started');
    } catch (e) {
      debugPrint('❌ Error starting question collection: $e');
      rethrow;
    }
  }

  /// Submit a question
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

  /// Get all questions for a session
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

  /// Start playing phase
  Future<void> startPlaying(String sessionId) async {
    try {
      await _supabase
          .from('pandora_sessions')
          .update({
            'status': 'playing',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);

      debugPrint('✅ Playing phase started');
    } catch (e) {
      debugPrint('❌ Error starting playing phase: $e');
      rethrow;
    }
  }

  /// End session and cleanup
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

  /// Get session by ID
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

  /// Subscribe to session changes
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
            if (payload.newRecord.isNotEmpty) {
              onSessionUpdate(payload.newRecord);
            }
          },
        )
        .subscribe();
  }

  /// Subscribe to participants changes
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
          callback: (payload) => onParticipantsChange(),
        )
        .subscribe();
  }

  /// Subscribe to questions changes
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
          callback: (payload) => onQuestionsChange(),
        )
        .subscribe();
  }
}