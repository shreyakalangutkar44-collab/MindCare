import '../games/personalized_memory/personalized_memory_game.dart';
import 'question_generator.dart';

class QuestionAdapter {
  static List<MemoryQuestion> toMemoryQuestions(
    List<PersonalizedQuestion> questions,
  ) {
    return questions.map((question) {
      return MemoryQuestion(
        question: question.question,
        options: question.options,
        correctAnswer: question.correctAnswer,
      );
    }).toList();
  }
}