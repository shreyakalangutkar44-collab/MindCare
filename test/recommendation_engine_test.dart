import 'package:flutter_test/flutter_test.dart';
import 'package:mindcare/ai/recommendation_engine.dart';

void main() {
  test('recommends the game with the lowest accuracy', () {
    final performances = [
      GamePerformance(
        gameName: 'Pattern Recognition',
        accuracy: 90,
      ),
      GamePerformance(
        gameName: 'Memory Match',
        accuracy: 80,
      ),
      GamePerformance(
        gameName: 'Story Memory',
        accuracy: 55,
      ),
    ];

    final engine = RecommendationEngine();

    final recommendation = engine.getRecommendation(performances);

    expect(
      recommendation,
      "Let's practice Story Memory today.",
    );
  });

  test('gives a default recommendation when there is no data', () {
    final engine = RecommendationEngine();

    final recommendation = engine.getRecommendation([]);

    expect(
      recommendation,
      "Let's start with a memory activity.",
    );
  });
}