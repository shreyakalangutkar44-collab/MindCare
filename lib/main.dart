import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'services/database_service.dart';
import 'models/game_result.dart';
import 'reminders/reminder_service.dart';
import 'games/memory_match/memory_match.dart';
import 'voice/voice_diary.dart';
import 'voice/voice_recall.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  await ReminderService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final AuthService _authService = AuthService();
  final DatabaseService _dbService = DatabaseService();
  final ReminderService _reminderService = ReminderService();
  String _result = 'Not tested yet';
  int _saveCount = 0;

  Future<void> _testLogin() async {
    setState(() => _result = 'Testing login...');
    final user = await _authService.login('elderly@test.com', 'test123');
    setState(() {
      _result = user != null
          ? 'LOGIN SUCCESS: ${user.email}'
          : 'LOGIN FAILED';
    });
  }

  void _testSaveGameResult() {
    _saveCount++;
    final currentSave = _saveCount;
    setState(() {
      _result = 'SAVE #$currentSave QUEUED (will sync when online)';
    });
    final result = GameResult(
      userId: 'testuser1',
      gameName: 'pattern',
      score: 8,
      totalQuestions: 10,
      difficulty: 1,
      timeTakenSeconds: 45,
    );
    _dbService.saveGameResult(result).then((_) {
      if (mounted) {
        setState(() {
          _result = 'SAVE #$currentSave CONFIRMED on server';
        });
      }
    }).catchError((e) {
      if (mounted) {
        setState(() {
          _result = 'SAVE #$currentSave ERROR: $e';
        });
      }
    });
  }

  void _testNotification() {
    _reminderService.fireTestNotification('Vitamin D');
    setState(() {
      _result = 'Notification fired - check your notification shade';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MindCare Test')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _testLogin,
                child: const Text('Test Login'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _testSaveGameResult,
                child: const Text('Save Test GameResult'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _testNotification,
                child: const Text('Test Notification'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemoryMatchGame(),
                    ),
                  );
                },
                child: const Text('Play Memory Match'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoiceDiaryScreen(),
                    ),
                  );
                },
                child: const Text('Voice Diary'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoiceRecall(),
                    ),
                  );
                },
                child: const Text('Voice Recall'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}