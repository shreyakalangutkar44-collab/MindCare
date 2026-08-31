class Diary {
  final String id;
  final String userId;
  final String text;
  final DateTime timestamp;

  Diary({
    required this.id,
    required this.userId,
    required this.text,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory Diary.fromMap(String id, Map<String, dynamic> map) {
    return Diary(
      id: id,
      userId: map['userId'],
      text: map['text'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}