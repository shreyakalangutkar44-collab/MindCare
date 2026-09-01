class PatientInfo {
  final String name;
  final String daughter;
  final String hobby;
  final String favoriteFood;
  final String pet;

  PatientInfo({
    required this.name,
    required this.daughter,
    required this.hobby,
    required this.favoriteFood,
    required this.pet,
  });
}

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
  List<PersonalizedQuestion> generateQuestions(PatientInfo patient) {
    return [
      PersonalizedQuestion(
        question: "What is ${patient.name}'s daughter's name?",
        options: [
          patient.daughter,
          "Anita",
          "Meena",
          "Riya",
        ],
        correctAnswer: patient.daughter,
      ),

      PersonalizedQuestion(
        question: "What is ${patient.name}'s hobby?",
        options: [
          "Cooking",
          patient.hobby,
          "Dancing",
          "Painting",
        ],
        correctAnswer: patient.hobby,
      ),

      PersonalizedQuestion(
        question: "What is ${patient.name}'s favorite food?",
        options: [
          "Pizza",
          "Biryani",
          patient.favoriteFood,
          "Sandwich",
        ],
        correctAnswer: patient.favoriteFood,
      ),

      PersonalizedQuestion(
        question: "What is the name of ${patient.name}'s pet?",
        options: [
          patient.pet,
          "Rocky",
          "Milo",
          "Leo",
        ],
        correctAnswer: patient.pet,
      ),
    ];
  }
}