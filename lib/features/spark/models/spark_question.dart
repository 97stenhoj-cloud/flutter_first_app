// lib/features/spark/models/spark_question.dart

class SparkQuestion {
  final String id;
  final String userId;
  final String question;
  final String? answer;
  final Map<String, dynamic>? generationPrompts;
  final bool isFavorited;
  final DateTime createdAt;
  final DateTime? expiresAt;

  SparkQuestion({
    required this.id,
    required this.userId,
    required this.question,
    this.answer,
    this.generationPrompts,
    this.isFavorited = false,
    required this.createdAt,
    this.expiresAt,
  });

  factory SparkQuestion.fromJson(Map<String, dynamic> json) {
    return SparkQuestion(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String?,
      generationPrompts: json['generation_prompts'] as Map<String, dynamic>?,
      isFavorited: json['is_favorited'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'question': question,
      'answer': answer,
      'generation_prompts': generationPrompts,
      'is_favorited': isFavorited,
      'created_at': createdAt.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  SparkQuestion copyWith({
    String? id,
    String? userId,
    String? question,
    String? answer,
    Map<String, dynamic>? generationPrompts,
    bool? isFavorited,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return SparkQuestion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      generationPrompts: generationPrompts ?? this.generationPrompts,
      isFavorited: isFavorited ?? this.isFavorited,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  // Check if question has expired
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  // Get time remaining until expiration
  Duration? get timeRemaining {
    if (expiresAt == null) return null;
    final now = DateTime.now();
    if (now.isAfter(expiresAt!)) return Duration.zero;
    return expiresAt!.difference(now);
  }
}

// Generation parameters for Spark questions
class SparkGenerationParams {
  final int questionCount; // 5, 10, 15, 20, or 25
  final int energy; // 1-5
  final int depth; // 1-5
  final int spice; // 1-4
  final int groupSize; // Number of people
  final String occasion; // Free text prompt
  final String? additionalPrompt; // Optional additional instructions

  SparkGenerationParams({
    required this.questionCount,
    required this.energy,
    required this.depth,
    required this.spice,
    required this.groupSize,
    required this.occasion,
    this.additionalPrompt,
  });

  Map<String, dynamic> toJson() {
    return {
      'question_count': questionCount,
      'energy': energy,
      'depth': depth,
      'spice': spice,
      'group_size': groupSize,
      'occasion': occasion,
      if (additionalPrompt != null && additionalPrompt!.isNotEmpty)
        'additional_prompt': additionalPrompt,
    };
  }

  factory SparkGenerationParams.fromJson(Map<String, dynamic> json) {
    return SparkGenerationParams(
      questionCount: json['question_count'] as int,
      energy: json['energy'] as int,
      depth: json['depth'] as int,
      spice: json['spice'] as int,
      groupSize: json['group_size'] as int,
      occasion: json['occasion'] as String,
      additionalPrompt: json['additional_prompt'] as String?,
    );
  }
}
