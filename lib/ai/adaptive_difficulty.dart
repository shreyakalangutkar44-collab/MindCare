
class AdaptiveDifficulty {
  int getNextDifficulty({
    required int currentDifficulty,
    required double accuracy,
  }) {
    // Increase difficulty if performance is strong
    if (accuracy >= 80 && currentDifficulty < 3) {
      return currentDifficulty + 1;
    }

    // Decrease difficulty if performance is weak
    if (accuracy < 50 && currentDifficulty > 1) {
      return currentDifficulty - 1;
    }

    // Keep the same difficulty
    return currentDifficulty;
  }
}
