import 'package:flutter/material.dart';
import 'games/story_memory/story_memory_game.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF51634E),
        ),
        useMaterial3: true,
      ),
      home: const StoryMemoryGame(),
    );
  }
}