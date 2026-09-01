class GameResult {
  final String userId;
  final String gameName;
  final int score;
  final int totalQuestions;
  final int difficulty;
  final int timeTakenSeconds;
  final DateTime timestamp;

  GameResult({
    required this.userId,
    required this.gameName,
    required this.score,
    required this.totalQuestions,
    required this.difficulty,
    required this.timeTakenSeconds,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  double get accuracy =>
      totalQuestions == 0 ? 0 : (score / totalQuestions) * 100;

  factory GameResult.fromMap(Map<String, dynamic> map) {
    return GameResult(
      userId: map['userId'],
      gameName: map['gameName'],
      score: map['score'],
      totalQuestions: map['totalQuestions'],
      difficulty: map['difficulty'],
      timeTakenSeconds: map['timeTakenSeconds'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'gameName': gameName,
      'score': score,
      'totalQuestions': totalQuestions,
      'accuracy': accuracy,
      'difficulty': difficulty,
      'timeTakenSeconds': timeTakenSeconds,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}