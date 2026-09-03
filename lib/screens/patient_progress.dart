
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/game_result.dart';
import '../services/database_service.dart';
import '../ai/recommendation_engine.dart';

class PatientProgressScreen extends StatefulWidget {
  const PatientProgressScreen({super.key});

  @override
  State<PatientProgressScreen> createState() =>
      _PatientProgressScreenState();
}

class _PatientProgressScreenState extends State<PatientProgressScreen> {
  final DatabaseService _databaseService = DatabaseService();
  final RecommendationEngine _recommendationEngine =
      RecommendationEngine();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text("Please log in to view progress."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Report"),
      ),
      body: StreamBuilder<List<GameResult>>(
        stream: _databaseService.streamGameResults(user.uid),
        builder: (context, snapshot) {
          // SHOW THE ACTUAL ERROR
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Unable to load\n\n${snapshot.error}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final results = snapshot.data ?? [];

          if (results.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "No game results yet.\n\nComplete a cognitive game to see your progress.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOverallProgress(results),
                const SizedBox(height: 20),

                _buildWeeklyPerformance(results),
                const SizedBox(height: 20),

                const Text(
                  "Cognitive Activities",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                _buildGameCard(
                  "Memory Match",
                  results,
                  "memory",
                ),

                _buildGameCard(
                  "Pattern Matching",
                  results,
                  "pattern",
                ),

                _buildGameCard(
                  "Story Memory",
                  results,
                  "story",
                ),

                _buildGameCard(
                  "Personalized Memory",
                  results,
                  "personalized",
                ),

                const SizedBox(height: 20),

                _buildWeeklySummary(results),
                const SizedBox(height: 20),

                _buildRecommendation(results),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverallProgress(List<GameResult> results) {
    final progress = _overallProgress(results);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Overall Progress",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            LinearProgressIndicator(
              value: progress,
            ),
            const SizedBox(height: 10),
            Text(
              "${(progress * 100).toStringAsFixed(0)}% overall performance",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyPerformance(List<GameResult> results) {
    final weeklyResults = _thisWeekResults(results);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Performance",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 180,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  final dayResults = weeklyResults.where((result) {
                    final date = result.timestamp;

                    return date.weekday == index + 1;
                  }).toList();

                  final average = _averageAccuracy(dayResults);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 25,
                        height: 120 * average,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        [
                          "M",
                          "T",
                          "W",
                          "T",
                          "F",
                          "S",
                          "S"
                        ][index],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(
    String title,
    List<GameResult> results,
    String gameName,
  ) {
    final average = _averageForGame(results, gameName);
    final progress = _gameProgress(results, gameName);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
            ),
            const SizedBox(height: 8),
            Text(
              "Accuracy: ${(average * 100).toStringAsFixed(0)}%",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklySummary(List<GameResult> results) {
    final thisWeek = _thisWeekResults(results);
    final previousWeek = _previousWeekResults(results);

    final currentAverage = _averageAccuracy(thisWeek);
    final previousAverage = _averageAccuracy(previousWeek);

    final improvement =
        _weeklyImprovement(currentAverage, previousAverage);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Summary",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "This week: ${(currentAverage * 100).toStringAsFixed(0)}%",
            ),
            const SizedBox(height: 8),
            Text(
              "Previous week: ${(previousAverage * 100).toStringAsFixed(0)}%",
            ),
            const SizedBox(height: 8),
            Text(
              improvement >= 0
                  ? "Improvement: +${(improvement * 100).toStringAsFixed(0)}%"
                  : "Change: ${(improvement * 100).toStringAsFixed(0)}%",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendation(List<GameResult> results) {
    final recommendation = _getRecommendation(results);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.lightbulb_outline,
              size: 30,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommended Activity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(recommendation),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _overallProgress(List<GameResult> results) {
    if (results.isEmpty) return 0;

    return _averageAccuracy(results);
  }

  double _averageForGame(
    List<GameResult> results,
    String gameName,
  ) {
    final gameResults = results.where((result) {
      final name = result.gameName.toLowerCase();

      if (gameName == "pattern") {
        return name == "pattern" ||
            name == "pattern match" ||
            name == "pattern matching" ||
            name == "pattern recognition";
      }

      return name.contains(gameName.toLowerCase());
    }).toList();

    return _averageAccuracy(gameResults);
  }

  double _gameScore(
    List<GameResult> results,
    String gameName,
  ) {
    return _averageForGame(results, gameName);
  }

  double _gameProgress(
    List<GameResult> results,
    String gameName,
  ) {
    return _gameScore(results, gameName).clamp(0.0, 1.0);
  }

  double _patternProgress(List<GameResult> results) {
    return _gameProgress(results, "pattern");
  }

  double _patternScore(List<GameResult> results) {
    return _gameScore(results, "pattern");
  }

  String _getRecommendation(List<GameResult> results) {
    final performances = [
      GamePerformance(
        gameName: "Memory Match",
        accuracy: _averageForGame(results, "memory"),
      ),
      GamePerformance(
        gameName: "Pattern Matching",
        accuracy: _patternScore(results),
      ),
      GamePerformance(
        gameName: "Story Memory",
        accuracy: _averageForGame(results, "story"),
      ),
      GamePerformance(
        gameName: "Personalized Memory",
        accuracy: _averageForGame(results, "personalized"),
      ),
    ];

    return _recommendationEngine.getRecommendation(
      performances,
    );
  }

  List<GameResult> _thisWeekResults(
    List<GameResult> results,
  ) {
    final now = DateTime.now();

    final startOfWeek =
        now.subtract(Duration(days: now.weekday - 1));

    final start = DateTime(
      startOfWeek.year,
      startOfWeek.month,
      startOfWeek.day,
    );

    return results.where((result) {
      return result.timestamp.isAfter(start);
    }).toList();
  }

  List<GameResult> _previousWeekResults(
    List<GameResult> results,
  ) {
    final now = DateTime.now();

    final startOfCurrentWeek =
        now.subtract(Duration(days: now.weekday - 1));

    final currentStart = DateTime(
      startOfCurrentWeek.year,
      startOfCurrentWeek.month,
      startOfCurrentWeek.day,
    );

    final previousStart =
        currentStart.subtract(const Duration(days: 7));

    return results.where((result) {
      return result.timestamp.isAfter(previousStart) &&
          result.timestamp.isBefore(currentStart);
    }).toList();
  }

  double _averageAccuracy(List<GameResult> results) {
    if (results.isEmpty) return 0;

    final total = results.fold<double>(
      0,
      (sum, result) => sum + result.accuracy,
    );

    return total / results.length;
  }

  double _weeklyImprovement(
    double current,
    double previous,
  ) {
    if (previous == 0) return current;

    return current - previous;
  }
}
