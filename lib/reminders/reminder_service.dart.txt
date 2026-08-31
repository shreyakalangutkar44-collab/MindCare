import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import '../models/reminder.dart';
import '../services/database_service.dart';

class ReminderService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  final DatabaseService _db = DatabaseService();

  Future<void> init() async {
    tz_data.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);

    await _notifications.initialize(initSettings);
  }

  Future<void> scheduleReminder(Reminder reminder) async {
    await _db.saveReminder(reminder);

    final parts = reminder.time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    final scheduledTime = _nextInstanceOfTime(hour, minute);

    await _notifications.zonedSchedule(
      reminder.id.hashCode,
      'Reminder',
      'Time for ${reminder.medicine}',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'mindcare_reminders',
          'MindCare Reminders',
          channelDescription: 'Medicine, hydration and activity reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: reminder.repeat == 'daily'
          ? DateTimeComponents.time
          : null,
    );
  }

  Future<void> cancelReminder(String reminderId) async {
    await _notifications.cancel(reminderId.hashCode);
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  Future<void> fireTestNotification(String medicine) async {
    await _notifications.show(
      0,
      'Reminder',
      'Time for $medicine',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'mindcare_reminders',
          'MindCare Reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }
}