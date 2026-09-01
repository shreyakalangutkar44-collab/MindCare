import 'package:flutter_test/flutter_test.dart';
import 'package:mindcare/ai/question_generator.dart';

void main() {
  test('generates personalized questions from patient information', () {
    final patient = PatientInfo(
      name: 'Asha',
      daughter: 'Priya',
      hobby: 'Gardening',
      favoriteFood: 'Pani Puri',
      pet: 'Bruno',
    );

    final generator = PersonalizedQuestionGenerator();

    final questions = generator.generateQuestions(patient);

    expect(questions.length, 4);

    expect(
      questions[0].question,
      "What is Asha's daughter's name?",
    );

    expect(questions[0].correctAnswer, 'Priya');

    expect(
      questions[1].correctAnswer,
      'Gardening',
    );

    expect(
      questions[2].correctAnswer,
      'Pani Puri',
    );

    expect(
      questions[3].correctAnswer,
      'Bruno',
    );
  });
}