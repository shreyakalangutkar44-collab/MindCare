import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/game_result.dart';
import '../models/diary.dart';
import '../models/reminder.dart';
import '../models/patient.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ---------------- GAME RESULTS ----------------

  Future<void> saveGameResult(GameResult result) async {
    await _db.collection('game_results').add(result.toMap());
  }

  Future<List<GameResult>> getGameResults(String userId) async {
    final snapshot = await _db
        .collection('game_results')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => GameResult.fromMap(doc.data()))
        .toList();
  }

  Stream<List<GameResult>> streamGameResults(String userId) {
    return _db
        .collection('game_results')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => GameResult.fromMap(doc.data())).toList());
  }

  // ---------------- DIARY ----------------

  Future<void> saveDiary(Diary diary) async {
    await _db.collection('diaries').add(diary.toMap());
  }

  Future<List<Diary>> getDiaries(String userId) async {
    final snapshot = await _db
        .collection('diaries')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => Diary.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<Diary?> getLatestDiary(String userId) async {
    final entries = await getDiaries(userId);
    return entries.isNotEmpty ? entries.first : null;
  }

  // ---------------- REMINDERS ----------------

  Future<void> saveReminder(Reminder reminder) async {
    await _db.collection('reminders').add(reminder.toMap());
  }

  Future<List<Reminder>> getReminders(String userId) async {
    final snapshot = await _db
        .collection('reminders')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => Reminder.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> updateReminderStatus(String reminderId, String status) async {
    await _db.collection('reminders').doc(reminderId).update({
      'status': status,
    });
  }

  // ---------------- PATIENT ----------------

  Future<Patient?> getPatient(String userId) async {
    final doc = await _db.collection('patients').doc(userId).get();
    if (!doc.exists) return null;
    return Patient.fromMap(doc.id, doc.data()!);
  }

  Future<void> savePatient(Patient patient) async {
    await _db.collection('patients').doc(patient.id).set(patient.toMap());
  }

  Future<List<Patient>> getPatientsForCaregiver(String caregiverId) async {
    final snapshot = await _db
        .collection('patients')
        .where('caregiverId', isEqualTo: caregiverId)
        .get();

    return snapshot.docs
        .map((doc) => Patient.fromMap(doc.id, doc.data()))
        .toList();
  }
}