import '../../domain/entities/questions.dart';
class QuestionDto {
  final String text;
  final String category;
  final int id;

  QuestionDto({required this.text, required this.category, required this.id});

  factory QuestionDto.fromJson(Map<String, dynamic> json, String category, int id) {
    return QuestionDto(
      text: json['text'] ?? json.toString(),
      category: category,
      id: id,
    );
  }

  Question toEntity() {
    return Question(text: text, category: category, id: id);
  }
}