class Question {
  final String text;
  final String category;
  final int id;

  const Question({
    required this.text,
    required this.category,
    required this.id,
  });

  @override
  String toString() => text;
}
