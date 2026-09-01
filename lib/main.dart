import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'services/database_service.dart';
import 'models/game_result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindCare Test',
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

    // Fire and forget: don't block the UI waiting for server confirmation.
    // Firestore queues this locally if offline and syncs automatically
    // once connectivity returns.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MindCare Test')),
      body: Center(
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
    );
  }
}