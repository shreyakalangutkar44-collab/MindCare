import 'package:flutter/material.dart';

class StoryQuestion {
  final String story;
  final String question;
  final List<String> options;
  final String correctAnswer;

  const StoryQuestion({
    required this.story,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class StoryMemoryGame extends StatefulWidget {
  const StoryMemoryGame({super.key});

  @override
  State<StoryMemoryGame> createState() => _StoryMemoryGameState();
}

class _StoryMemoryGameState extends State<StoryMemoryGame> {
  int _difficulty = 1;
  int _currentQuestion = 0;
  int _score = 0;
  int _correctAnswers = 0;

  String? _selectedAnswer;
  bool _answered = false;

  List<StoryQuestion> get _questions {
    if (_difficulty == 1) {
      return const [
        StoryQuestion(
          story:
              'Ravi went to the park in the morning. He saw a small brown dog playing with a ball.',
          question: 'Where did Ravi go?',
          options: ['Park', 'School', 'Market'],
          correctAnswer: 'Park',
        ),
        StoryQuestion(
          story:
              'Ravi went to the park in the morning. He saw a small brown dog playing with a ball.',
          question: 'What was the dog playing with?',
          options: ['A ball', 'A book', 'A tree'],
          correctAnswer: 'A ball',
        ),
      ];
    }

    if (_difficulty == 2) {
      return const [
        StoryQuestion(
          story:
              'Meena visited her grandmother on Sunday. They sat in the garden and drank tea. Later, Meena helped her grandmother water the flowers.',
          question: 'Who did Meena visit?',
          options: ['Her grandmother', 'Her teacher', 'Her friend'],
          correctAnswer: 'Her grandmother',
        ),
        StoryQuestion(
          story:
              'Meena visited her grandmother on Sunday. They sat in the garden and drank tea. Later, Meena helped her grandmother water the flowers.',
          question: 'What did Meena and her grandmother drink?',
          options: ['Tea', 'Juice', 'Milk'],
          correctAnswer: 'Tea',
        ),
        StoryQuestion(
          story:
              'Meena visited her grandmother on Sunday. They sat in the garden and drank tea. Later, Meena helped her grandmother water the flowers.',
          question: 'What did Meena help with?',
          options: ['Watering flowers', 'Cooking dinner', 'Cleaning the house'],
          correctAnswer: 'Watering flowers',
        ),
      ];
    }

    return const [
      StoryQuestion(
        story:
            'On Saturday morning, Arjun travelled to his hometown with his family. They visited an old family house near a large river. In the afternoon, they had lunch together and then walked to the river. Arjun noticed several colourful birds near the water.',
        question: 'When did Arjun travel to his hometown?',
        options: ['Saturday morning', 'Sunday evening', 'Friday afternoon'],
        correctAnswer: 'Saturday morning',
      ),
      StoryQuestion(
        story:
            'On Saturday morning, Arjun travelled to his hometown with his family. They visited an old family house near a large river. In the afternoon, they had lunch together and then walked to the river. Arjun noticed several colourful birds near the water.',
        question: 'Where was the old family house?',
        options: ['Near a large river', 'Near a school', 'Near a market'],
        correctAnswer: 'Near a large river',
      ),
      StoryQuestion(
        story:
            'On Saturday morning, Arjun travelled to his hometown with his family. They visited an old family house near a large river. In the afternoon, they had lunch together and then walked to the river. Arjun noticed several colourful birds near the water.',
        question: 'What did Arjun notice near the water?',
        options: ['Colourful birds', 'A boat', 'A dog'],
        correctAnswer: 'Colourful birds',
      ),
      StoryQuestion(
        story:
            'On Saturday morning, Arjun travelled to his hometown with his family. They visited an old family house near a large river. In the afternoon, they had lunch together and then walked to the river. Arjun noticed several colourful birds near the water.',
        question: 'What did the family do in the afternoon?',
        options: ['Had lunch', 'Went shopping', 'Went to school'],
        correctAnswer: 'Had lunch',
      ),
    ];
  }

  StoryQuestion get _currentStory => _questions[_currentQuestion];

  void _checkAnswer(String answer) {
    if (_answered) {
      return;
    }

    setState(() {
      _selectedAnswer = answer;
      _answered = true;

      if (answer == _currentStory.correctAnswer) {
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
      _finishGame();
    }
  }

  void _finishGame() {
    final double accuracy =
        (_correctAnswers / _questions.length) * 100;

    if (accuracy >= 80 && _difficulty < 3) {
      _difficulty++;
    } else if (accuracy < 50 && _difficulty > 1) {
      _difficulty--;
    }

    String level;

    if (_difficulty == 1) {
      level = 'Easy';
    } else if (_difficulty == 2) {
      level = 'Medium';
    } else {
      level = 'Hard';
    }

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
            'Story Complete!',
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
                Icons.menu_book,
                size: 65,
                color: Color(0xFF735C00),
              ),
              const SizedBox(height: 20),
              Text(
                'Score: $_score / ${_questions.length}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Accuracy: ${accuracy.toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                'Next difficulty: $level',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF51634E),
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _startNewRound();
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
                'Continue',
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

  void _startNewRound() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _correctAnswers = 0;
      _selectedAnswer = null;
      _answered = false;
    });
  }

  Color _optionColor(String answer) {
    if (!_answered) {
      return const Color(0xFFFDF9EE);
    }

    if (answer == _currentStory.correctAnswer) {
      return const Color(0xFFD3E8CE);
    }

    if (answer == _selectedAnswer) {
      return const Color(0xFFFFDAD6);
    }

    return const Color(0xFFFDF9EE);
  }

  Color _borderColor(String answer) {
    if (!_answered) {
      return const Color(0xFFE6E2D8);
    }

    if (answer == _currentStory.correctAnswer) {
      return const Color(0xFF51634E);
    }

    if (answer == _selectedAnswer) {
      return const Color(0xFF974731);
    }

    return const Color(0xFFE6E2D8);
  }

  void _voiceSupport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Voice support is ready to be connected to the voice service.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final story = _currentStory;

    String difficultyName;

    if (_difficulty == 1) {
      difficultyName = 'Easy';
    } else if (_difficulty == 2) {
      difficultyName = 'Medium';
    } else {
      difficultyName = 'Hard';
    }

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
              constraints: const BoxConstraints(maxWidth: 650),
              child: Column(
                children: [
                  Text(
                    'Story Memory',
                    style: const TextStyle(
                      color: Color(0xFF1C1C15),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Difficulty: $difficultyName',
                    style: const TextStyle(
                      color: Color(0xFF51634E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

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

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
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
                    child: Text(
                      story.story,
                      style: const TextStyle(
                        color: Color(0xFF1C1C15),
                        fontSize: 21,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    story.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1C1C15),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  ...story.options.map(
                    (answer) {
                      final bool isCorrect =
                          answer == story.correctAnswer;

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
                              backgroundColor:
                                  _optionColor(answer),
                              disabledBackgroundColor:
                                  _optionColor(answer),
                              foregroundColor:
                                  const Color(0xFF1C1C15),
                              disabledForegroundColor:
                                  const Color(0xFF1C1C15),
                              elevation: 3,
                              side: BorderSide(
                                color:
                                    _borderColor(answer),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.menu_book,
                                  color: Color(0xFF51634E),
                                  size: 28,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    answer,
                                    style: const TextStyle(
                                      fontSize: 20,
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

                  if (_answered)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 15,
                      ),
                      child: Text(
                        _selectedAnswer ==
                                story.correctAnswer
                            ? 'Correct! 🎉'
                            : 'Good try! The correct answer is '
                                '${story.correctAnswer}.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedAnswer ==
                                  story.correctAnswer
                              ? const Color(0xFF51634E)
                              : const Color(0xFF974731),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

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
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          _currentQuestion ==
                                  _questions.length - 1
                              ? 'Finish Story'
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF974731),
        foregroundColor: Colors.white,
        onPressed: _voiceSupport,
        child: const Icon(
          Icons.mic,
          size: 32,
        ),
      ),
    );
  }
}