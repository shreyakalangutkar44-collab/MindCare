class Reminder {
  final String id;
  final String userId;
  final String medicine;
  final String time;
  final String repeat;
  final String status;

  Reminder({
    required this.id,
    required this.userId,
    required this.medicine,
    required this.time,
    required this.repeat,
    this.status = 'pending',
  });

  factory Reminder.fromMap(String id, Map<String, dynamic> map) {
    return Reminder(
      id: id,
      userId: map['userId'],
      medicine: map['medicine'],
      time: map['time'],
      repeat: map['repeat'],
      status: map['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'medicine': medicine,
      'time': time,
      'repeat': repeat,
      'status': status,
    };
  }
}