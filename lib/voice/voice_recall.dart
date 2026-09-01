import 'package:flutter/material.dart';
import 'speech_service.dart';
import 'tts_service.dart';

class VoiceRecall extends StatefulWidget {
  const VoiceRecall({super.key});

  @override
  State<VoiceRecall> createState() => _VoiceRecallState();
}

class _VoiceRecallState extends State<VoiceRecall> {
  final SpeechService _speechService = SpeechService();
  final TtsService _ttsService = TtsService();

  final List<Map<String, String>> _memories = [
    {
      'question': 'Who went to the park with you?',
      'answer': 'Priya',
    },
    {
      'question': 'Who did you have breakfast with?',
      'answer': 'my daughter',
    },
    {
      'question': 'Where did you go in the evening?',
      'answer': 'garden',
    },
  ];

  int _currentIndex = 0;
  String _spokenAnswer = '';
  bool _isListening = false;
  bool _showResult = false;
  bool _isCorrect = false;

  Map<String, String> get _currentMemory => _memories[_currentIndex];

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    await _speechService.initialize();
  }

  Future<void> _readQuestion() async {
    await _ttsService.speak(
      _currentMemory['question']!,
    );
  }

  Future<void> _startListening() async {
    setState(() {
      _isListening = true;
      _spokenAnswer = '';
      _showResult = false;
    });

    await _speechService.startListening(
      onResult: (text) {
        if (!mounted) return;

        setState(() {
          _spokenAnswer = text;
        });
      },
    );
  }

  Future<void> _stopListening() async {
    await _speechService.stopListening();

    if (!mounted) return;

    setState(() {
      _isListening = false;
    });

    if (_spokenAnswer.trim().isNotEmpty) {
      _checkAnswer();
    }
  }

  void _checkAnswer() {
    final userAnswer = _spokenAnswer.toLowerCase().trim();
    final correctAnswer =
        _currentMemory['answer']!.toLowerCase().trim();

    final correct = userAnswer.contains(correctAnswer) ||
        correctAnswer.contains(userAnswer);

    setState(() {
      _isCorrect = correct;
      _showResult = true;
    });

    if (correct) {
      _ttsService.speak(
        'Well done! That is correct.',
      );
    } else {
      _ttsService.speak(
        'That is okay. The correct answer was ${_currentMemory['answer']}.',
      );
    }
  }

  void _nextQuestion() {
    if (_currentIndex < _memories.length - 1) {
      setState(() {
        _currentIndex++;
        _spokenAnswer = '';
        _showResult = false;
        _isCorrect = false;
      });
    } else {
      _showCompletionMessage();
    }
  }

  void _showCompletionMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Great Job!'),
          content: const Text(
            'You completed all the memory recall questions.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _ttsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = _currentMemory['question']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Recall'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Memory Recall',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 12),

              Text(
                'Question ${_currentIndex + 1} of ${_memories.length}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium,
              ),

              const SizedBox(height: 30),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.psychology,
                        size: 60,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              IconButton(
                onPressed: _readQuestion,
                icon: const Icon(Icons.volume_up),
                iconSize: 36,
                tooltip: 'Read question',
              ),

              const SizedBox(height: 10),

              Text(
                _spokenAnswer.isEmpty
                    ? 'Tap the microphone and answer aloud.'
                    : 'Your answer: $_spokenAnswer',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),

              const Spacer(),

              GestureDetector(
                onTap: _isListening
                    ? _stopListening
                    : _startListening,
                child: CircleAvatar(
                  radius: 42,
                  child: Icon(
                    _isListening
                        ? Icons.stop
                        : Icons.mic,
                    size: 42,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                _isListening
                    ? 'Tap to stop'
                    : 'Tap to answer',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 20),

              if (_showResult)
                Text(
                  _isCorrect
                      ? '✓ Correct! Well done!'
                      : 'Not quite. The answer was ${_currentMemory['answer']}.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _isCorrect
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),

              const SizedBox(height: 20),

              if (_showResult)
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text(
                    _currentIndex == _memories.length - 1
                        ? 'Finish'
                        : 'Next Question',
                  ),
                ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}