import 'dart:math';
import 'package:flutter/material.dart';

class MemoryQuestion {
  final String imagePath;
  final String correctAnswer;
  final List<String> options;

  const MemoryQuestion({
    required this.imagePath,
    required this.correctAnswer,
    required this.options,
  });
}

class PersonalizedMemoryGame extends StatefulWidget {
  const PersonalizedMemoryGame({super.key});

  @override
  State<PersonalizedMemoryGame> createState() =>
      _PersonalizedMemoryGameState();
}

class _PersonalizedMemoryGameState extends State<PersonalizedMemoryGame> {
  // Temporary local images.
  // Later P5 can replace these with Firebase images.
  final List<MemoryQuestion> _questions = [
    const MemoryQuestion(
      imagePath: 'assets/memory_images/Apple.jpg',
      correctAnswer: 'Apple',
      options: ['Apple', 'Car', 'House'],
    ),
    const MemoryQuestion(
      imagePath: 'assets/memory_images/Car.jpg',
      correctAnswer: 'Car',
      options: ['Tree', 'Car', 'Apple'],
    ),
    const MemoryQuestion(
      imagePath: 'assets/memory_images/House.jpg',
      correctAnswer: 'House',
      options: ['House', 'Tree', 'Car'],
    ),
    const MemoryQuestion(
      imagePath: 'assets/memory_images/Tree.jpg',
      correctAnswer: 'Tree',
      options: ['Apple', 'House', 'Tree'],
    ),
  ];

  int _currentQuestion = 0;
  int _score = 0;
  int _correctAnswers = 0;

  String? _selectedAnswer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();

    // Shuffle the questions every time the game starts.
    _questions.shuffle(Random());
  }

  void _checkAnswer(String answer) {
    if (_answered) {
      return;
    }

    final question = _questions[_currentQuestion];

    setState(() {
      _selectedAnswer = answer;
      _answered = true;

      if (answer == question.correctAnswer) {
        _score++;
        _correctAnswers++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _answered = false;
      });
    } else {
      _showResult();
    }
  }

  void _restartGame() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _correctAnswers = 0;
      _selectedAnswer = null;
      _answered = false;

      _questions.shuffle(Random());
    });
  }

  void _showResult() {
    final double accuracy =
        (_correctAnswers / _questions.length) * 100;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFDF9EE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Game Complete!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF51634E),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.emoji_events,
                size: 65,
                color: Color(0xFF735C00),
              ),
              const SizedBox(height: 20),
              Text(
                'Score: $_score / ${_questions.length}',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Accuracy: ${accuracy.toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 21,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _restartGame();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF51634E),
                foregroundColor: Colors.white,
                minimumSize: const Size(180, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Play Again',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getOptionColor(String answer) {
    if (!_answered) {
      return const Color(0xFFFDF9EE);
    }

    final question = _questions[_currentQuestion];

    if (answer == question.correctAnswer) {
      return const Color(0xFFD3E8CE);
    }

    if (answer == _selectedAnswer) {
      return const Color(0xFFFFDAD6);
    }

    return const Color(0xFFFDF9EE);
  }

  Color _getBorderColor(String answer) {
    if (!_answered) {
      return const Color(0xFFE6E2D8);
    }

    final question = _questions[_currentQuestion];

    if (answer == question.correctAnswer) {
      return const Color(0xFF51634E);
    }

    if (answer == _selectedAnswer) {
      return const Color(0xFF974731);
    }

    return const Color(0xFFE6E2D8);
  }

  IconData _getIcon(String answer) {
    switch (answer) {
      case 'Apple':
        return Icons.apple;
      case 'Car':
        return Icons.directions_car;
      case 'House':
        return Icons.home;
      case 'Tree':
        return Icons.park;
      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF9EE),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF9EE),
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xFF51634E),
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),

        title: const Text(
          'MindCare',
          style: TextStyle(
            color: Color(0xFF51634E),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 650,
              ),
              child: Column(
                children: [
                  // Progress
                  Text(
                    'Question ${_currentQuestion + 1} of ${_questions.length}',
                    style: const TextStyle(
                      color: Color(0xFF51634E),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value:
                          (_currentQuestion + 1) /
                              _questions.length,
                      minHeight: 10,
                      backgroundColor: const Color(0xFFE6E2D8),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(
                        Color(0xFF51634E),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Memory image
                  Container(
                    width: double.infinity,
                    height: 350,
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE6E2D8),
                        width: 2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 24,
                          offset: Offset(0, 4),
                          color: Color(0x1F1C1C15),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        question.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 70,
                              color: Color(0xFF747871),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Question
                  const Text(
                    'What is this?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1C1C15),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Take your time to look closely.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF434841),
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Answer buttons
                  ...question.options.map(
                    (answer) {
                      final bool isCorrect =
                          answer == question.correctAnswer;
                      final bool isSelected =
                          answer == _selectedAnswer;

                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: 14),
                        child: SizedBox(
                          width: double.infinity,
                          height: 72,
                          child: ElevatedButton(
                            onPressed: _answered
                                ? null
                                : () => _checkAnswer(answer),

                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor:
                                  _getOptionColor(answer),
                              disabledBackgroundColor:
                                  _getOptionColor(answer),
                              foregroundColor:
                                  const Color(0xFF1C1C15),
                              disabledForegroundColor:
                                  const Color(0xFF1C1C15),

                              side: BorderSide(
                                color:
                                    _getBorderColor(answer),
                                width: 2,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),

                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),

                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration:
                                      const BoxDecoration(
                                    color: Color(0xFFE6E2D8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _getIcon(answer),
                                    color:
                                        const Color(0xFF51634E),
                                    size: 27,
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: Text(
                                    answer,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 21,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ),
                                ),

                                if (_answered && isCorrect)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF51634E),
                                    size: 30,
                                  )
                                else if (_answered &&
                                    isSelected &&
                                    !isCorrect)
                                  const Icon(
                                    Icons.cancel,
                                    color: Color(0xFF974731),
                                    size: 30,
                                  )
                                else
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF747871),
                                    size: 30,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Feedback
                  if (_answered)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 15,
                      ),
                      child: Text(
                        _selectedAnswer ==
                                question.correctAnswer
                            ? 'Correct! 🎉'
                            : 'Good try! The correct answer is '
                                '${question.correctAnswer}.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedAnswer ==
                                  question.correctAnswer
                              ? const Color(0xFF51634E)
                              : const Color(0xFF974731),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  // Next / Finish
                  if (_answered)
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF51634E),
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          _currentQuestion ==
                                  _questions.length - 1
                              ? 'Finish Game'
                              : 'Next Question',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),

      
    );
  }
}