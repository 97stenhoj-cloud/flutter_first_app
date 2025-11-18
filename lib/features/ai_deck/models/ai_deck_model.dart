// lib/features/ai_deck/models/ai_deck_model.dart

class GenerationPrompts {
  final String occasion;
  final int groupSize; // 2-10 people
  final int numCards; // how many cards to create
  final int energy; // 1-5 (vibe/intensity)
  final int depth; // 1-5 (how personal/serious)
  final int spice; // 1-4 (how edgy/cheeky)
  final String? remarks;

  GenerationPrompts({
    required this.occasion,
    required this.groupSize,
    required this.numCards,
    required this.energy,
    required this.depth,
    required this.spice,
    this.remarks,
  });

  Map<String, dynamic> toJson() => {
        'occasion': occasion,
        'group_size': groupSize,
        'num_cards': numCards,
        'energy': energy,
        'depth': depth,
        'spice': spice,
        if (remarks != null && remarks!.isNotEmpty) 'remarks': remarks,
      };

  factory GenerationPrompts.fromJson(Map<String, dynamic> json) {
    return GenerationPrompts(
      occasion: json['occasion'] as String,
      groupSize: json['group_size'] as int,
      numCards: json['num_cards'] as int,
      energy: json['energy'] as int,
      depth: json['depth'] as int,
      spice: json['spice'] as int,
      remarks: json['remarks'] as String?,
    );
  }
}

class AIQuestion {
  final String question;
  final String answer;
  bool isKept; // For tracking during review

  AIQuestion({
    required this.question,
    required this.answer,
    this.isKept = false,
  });

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
      };

  factory AIQuestion.fromJson(Map<String, dynamic> json) {
    return AIQuestion(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  AIQuestion copyWith({
    String? question,
    String? answer,
    bool? isKept,
  }) {
    return AIQuestion(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      isKept: isKept ?? this.isKept,
    );
  }
}

class AIGeneratedDeck {
  final String? id;
  final String userId;
  final String deckName;
  final GenerationPrompts generationPrompts;
  final List<AIQuestion> questions;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AIGeneratedDeck({
    this.id,
    required this.userId,
    required this.deckName,
    required this.generationPrompts,
    required this.questions,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'user_id': userId,
        'deck_name': deckName,
        'generation_prompts': generationPrompts.toJson(),
        'questions': questions.map((q) => q.toJson()).toList(),
        if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
      };

  factory AIGeneratedDeck.fromJson(Map<String, dynamic> json) {
    return AIGeneratedDeck(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      deckName: json['deck_name'] as String,
      generationPrompts:
          GenerationPrompts.fromJson(json['generation_prompts'] as Map<String, dynamic>),
      questions: (json['questions'] as List)
          .map((q) => AIQuestion.fromJson(q as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  // Convert to format suitable for custom decks
  List<String> getQuestionsAsStringList() {
    return questions.map((q) => q.question).toList();
  }

  // Get only kept questions (for after review)
  List<AIQuestion> getKeptQuestions() {
    return questions.where((q) => q.isKept).toList();
  }

  AIGeneratedDeck copyWith({
    String? id,
    String? userId,
    String? deckName,
    GenerationPrompts? generationPrompts,
    List<AIQuestion>? questions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AIGeneratedDeck(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      deckName: deckName ?? this.deckName,
      generationPrompts: generationPrompts ?? this.generationPrompts,
      questions: questions ?? this.questions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

// Response model from the Edge Function
class GenerateQuestionsResponse {
  final List<AIQuestion> questions;
  final int batchNumber;

  GenerateQuestionsResponse({
    required this.questions,
    required this.batchNumber,
  });

  factory GenerateQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return GenerateQuestionsResponse(
      questions: (json['questions'] as List)
          .map((q) => AIQuestion.fromJson(q as Map<String, dynamic>))
          .toList(),
      batchNumber: json['batch_number'] as int,
    );
  }
}