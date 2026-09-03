

import 'package:flutter/material.dart';
import 'dart:math';
import '../models/game_result.dart';
import '../services/database_service.dart';
import '../services/auth_service.dart';

class PatternMatchGame extends StatefulWidget {
  const PatternMatchGame({super.key});

  @override
  State<PatternMatchGame> createState() => _PatternMatchGameState();
}

class _PatternMatchGameState extends State<PatternMatchGame> {
  final DatabaseService _dbService = DatabaseService();
  final AuthService _authService = AuthService();

  final List<IconData> allIcons = [
    Icons.eco,
    Icons.star,
    Icons.circle,
    Icons.square,
    Icons.favorite,
    Icons.pets,
  ];

  List<IconData> sequence = [];
  List<IconData> options = [];
  IconData? correctAnswer;

  int currentRound = 1;
  final int totalRounds = 4; // ← Changed to 4 rounds
  int score = 0;
  bool showFeedback = false;
  bool isCorrect = false;
  bool isSaving = false;
  DateTime? _startTime;

  // Colors
  static const Color bgColor = Color(0xFFFDF9EE);
  static const Color primary = Color(0xFF51634E);
  static const Color secondary = Color(0xFF974725);
  static const Color surfaceContainer = Color(0xFFF1EEE3);
  static const Color surfaceVariant = Color(0xFFE6E2D8);
  static const Color tertiaryFixed = Color(0xFFFFDEA4);
  static const Color tertiary = Color(0xFF765A1F);
  static const Color progressColor = Color(0xFFE7C17C);

  // Motivating messages for wrong answers
  final List<String> motivatingMessages = [
    "Good try! You can do it!",
    "Almost! Keep going!",
    "Nice effort! Try the next one!",
    "You're learning! Let's continue!",
    "Don't worry, next one will be better!",
  ];

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _generateNewRound();
  }

  void _generateNewRound() {
    final random = Random();

    // Difficulty increases with rounds
    int sequenceLength;
    if (currentRound <= 2) {
      sequenceLength = 3; // Easy
    } else {
      sequenceLength = 4; // Harder
    }

    // Create a repeating pattern (A B A B ...)
    final iconA = allIcons[random.nextInt(allIcons.length)];
    IconData iconB;
    do {
      iconB = allIcons[random.nextInt(allIcons.length)];
    } while (iconB == iconA);

    sequence = [];
    for (int i = 0; i < sequenceLength - 1; i++) {
      sequence.add(i % 2 == 0 ? iconA : iconB);
    }

    // Correct answer is the next one in the pattern
    correctAnswer = (sequenceLength - 1) % 2 == 0 ? iconA : iconB;

    // Create 4 options
    Set<IconData> optionSet = {correctAnswer!};
    while (optionSet.length < 4) {
      optionSet.add(allIcons[random.nextInt(allIcons.length)]);
    }
    options = optionSet.toList()..shuffle();

    setState(() {
      showFeedback = false;
    });
  }

  void _checkAnswer(IconData selected) {
    final correct = selected == correctAnswer;

    setState(() {
      isCorrect = correct;
      showFeedback = true;
      if (correct) score++;
    });

    Future.delayed(const Duration(milliseconds: 1300), () {
      if (!mounted) return;
      if (currentRound < totalRounds) {
        setState(() {
          currentRound++;
          _generateNewRound();
        });
      } else {
        _finishGame();
      }
    });
  }

  Future<void> _finishGame() async {
    setState(() => isSaving = true);
    final timeTaken = DateTime.now().difference(_startTime!).inSeconds;
    final user = _authService.currentUser;

    final result = GameResult(
      userId: user?.uid ?? 'guest',
      gameName: 'pattern',
      score: score,
      totalQuestions: totalRounds,
      difficulty: 1,
      timeTakenSeconds: timeTaken,
    );

    try {
      await _dbService.saveGameResult(result);
    } catch (e) {
      debugPrint("Error saving result: $e");
    }

    if (!mounted) return;
    setState(() => isSaving = false);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "Well Done!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        content: Text(
          "You scored $score out of $totalRounds\nResult saved!",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: secondary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Back", style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentRound = 1;
                score = 0;
                _startTime = DateTime.now();
                _generateNewRound();
              });
            },
            child: const Text("Play Again", style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pattern Match",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primary,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.logout, color: primary, size: 22),
            label: const Text("Exit", style: TextStyle(fontSize: 16, color: primary)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 12),

            // Round + Progress
            Text(
              "Round $currentRound of $totalRounds",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: currentRound / totalRounds,
                minHeight: 12,
                backgroundColor: surfaceVariant,
                color: progressColor,
              ),
            ),
            const SizedBox(height: 24),

            // Instruction
            const Text(
              "What comes next?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            const SizedBox(height: 20),

            // Sequence
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: surfaceContainer,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: surfaceVariant, width: 2),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...sequence.map((icon) => _buildSequenceItem(icon)),
                    _buildQuestionItem(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Options
            if (!showFeedback && !isSaving)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.2,
                  children: options.map((icon) => _buildOptionButton(icon)).toList(),
                ),
              ),

            // Feedback
            if (showFeedback)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: isCorrect ? Colors.green.shade50 : const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: isCorrect ? Colors.green.shade300 : const Color(0xFFFFCC80),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  isCorrect
                      ? "Correct! Well done!"
                      : motivatingMessages[Random().nextInt(motivatingMessages.length)],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? Colors.green.shade800 : const Color(0xFFEF6C00),
                  ),
                ),
              ),

            if (isSaving)
              const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(color: primary),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondary,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Voice assistant coming soon")),
          );
        },
        child: const Icon(Icons.record_voice_over, size: 32, color: Colors.white),
      ),
    );
  }

  Widget _buildSequenceItem(IconData icon) {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: surfaceVariant, width: 2),
      ),
      child: Icon(icon, size: 34, color: secondary),
    );
  }

  Widget _buildQuestionItem() {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: tertiaryFixed,
        shape: BoxShape.circle,
        border: Border.all(color: tertiary, width: 2.5),
      ),
      child: const Center(
        child: Text(
          "??",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildOptionButton(IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: surfaceVariant, width: 2),
        ),
      ),
      onPressed: () => _checkAnswer(icon),
      child: Icon(icon, size: 44, color: primary),
    );
  }
}