import '../models/patient.dart';

class PersonalizedQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  PersonalizedQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class PersonalizedQuestionGenerator {
  List<PersonalizedQuestion> generateQuestions(Patient patient) {
    final personalInfo = patient.personalInfo;

    final daughter = personalInfo.daughter ?? 'Unknown';
    final hobby = personalInfo.hobby ?? 'Unknown';
    final favoriteFood = personalInfo.favoriteFood ?? 'Unknown';
    final pet = personalInfo.pet ?? 'Unknown';

    return [
      PersonalizedQuestion(
        question: "What is ${patient.name}'s daughter's name?",
        options: [
          daughter,
          'Anita',
          'Meena',
          'Riya',
        ],
        correctAnswer: daughter,
      ),

      PersonalizedQuestion(
        question: "What is ${patient.name}'s hobby?",
        options: [
          'Cooking',
          hobby,
          'Dancing',
          'Painting',
        ],
        correctAnswer: hobby,
      ),

      PersonalizedQuestion(
        question: "What is ${patient.name}'s favorite food?",
        options: [
          'Pizza',
          'Biryani',
          favoriteFood,
          'Sandwich',
        ],
        correctAnswer: favoriteFood,
      ),

      PersonalizedQuestion(
        question: "What is the name of ${patient.name}'s pet?",
        options: [
          pet,
          'Rocky',
          'Milo',
          'Leo',
        ],
        correctAnswer: pet,
      ),
    ];
  }
}