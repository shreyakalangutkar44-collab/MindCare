import 'package:flutter/material.dart';
import '../games/memory_match/memory_match.dart';
import '../games/pattern_match_game.dart';
import '../voice/voice_diary.dart';
import '../voice/voice_recall.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _comingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Namaste, Arunjyoti",
                    style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                  ),
                  ElevatedButton(
                    onPressed: () => _comingSoon(context),
                    child: const Text("Help"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "It is a beautiful day for some gentle brain exercise. Take your time and enjoy the activities.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MemoryMatchGame(),
                        ),
                      );
                    },
                    child: const Text("Memory Match"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatternMatchGame(),
                        ),
                      );
                    },
                    child: const Text("Pattern Game"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VoiceDiaryScreen(),
                        ),
                      );
                    },
                    child: const Text("Talk to me"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VoiceRecall(),
                        ),
                      );
                    },
                    child: const Text("Voice Recall"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}