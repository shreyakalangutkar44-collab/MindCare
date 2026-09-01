class GamePerformance {
  final String gameName;
  final double accuracy;

  GamePerformance({
    required this.gameName,
    required this.accuracy,
  });
}

class RecommendationEngine {
  String getRecommendation(List<GamePerformance> performances) {
    if (performances.isEmpty) {
      return "Let's start with a memory activity.";
    }

    GamePerformance weakestGame = performances.first;

    for (final performance in performances) {
      if (performance.accuracy < weakestGame.accuracy) {
        weakestGame = performance;
      }
    }

    return _createRecommendation(weakestGame.gameName);
  }

  String _createRecommendation(String gameName) {
    switch (gameName) {
      case "Pattern Recognition":
        return "Let's practice Pattern Recognition today.";

      case "Memory Match":
        return "Let's practice Memory Match today.";

      case "Story Memory":
        return "Let's practice Story Memory today.";

      case "Personalized Memory":
        return "Let's practice Personalized Memory today.";

      default:
        return "Let's try a memory activity today.";
    }
  }
}