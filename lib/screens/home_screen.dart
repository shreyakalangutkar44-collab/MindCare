import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../games/memory_match/memory_match.dart';
import '../games/pattern_match_game.dart';
import '../voice/voice_diary.dart';
import '../voice/voice_recall.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color cream = Color(0xFFFDF9EE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color sage = Color(0xFF51634E);
  static const Color sageDark = Color(0xFF394B38);
  static const Color sageLight = Color(0xFFD3E8CE);
  static const Color terracotta = Color(0xFF974731);
  static const Color ink = Color(0xFF1C1C15);

  String _displayName = 'there';
  bool _loadingName = true;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (doc.exists && doc.data() != null && doc.data()!['name'] != null) {
          setState(() {
            _displayName = doc.data()!['name'];
            _loadingName = false;
          });
          return;
        }
      } catch (e) {
        // fall through to default below
      }
    }

    setState(() {
      _loadingName = false;
    });
  }

  void _comingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: sageLight,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.self_improvement,
                      color: sageDark,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _loadingName ? 'Namaste...' : 'Namaste, $_displayName',
                          style: const TextStyle(
                            color: ink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'MindCare',
                          style: TextStyle(
                            color: Color(0xFF77776D),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _comingSoon(context),
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE7E3D8)),
                      ),
                      child: const Icon(
                        Icons.help_outline,
                        color: sageDark,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: sageDark,
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: [
                    BoxShadow(
                      color: ink.withValues(alpha: .12),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good day to you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'It is a beautiful day for some gentle brain exercise. Take your time and enjoy the activities.',
                      style: TextStyle(
                        color: Color(0xFFDCE8D8),
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Activities',
                style: TextStyle(
                  color: ink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _activityCard(
                      context: context,
                      icon: Icons.grid_view_rounded,
                      title: 'Memory Match',
                      color: terracotta,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MemoryMatchGame(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _activityCard(
                      context: context,
                      icon: Icons.pattern,
                      title: 'Pattern Game',
                      color: sage,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PatternMatchGame(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _activityCard(
                      context: context,
                      icon: Icons.menu_book,
                      title: 'Talk to me',
                      color: sageDark,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VoiceDiaryScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _activityCard(
                      context: context,
                      icon: Icons.psychology_outlined,
                      title: 'Voice Recall',
                      color: terracotta,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VoiceRecall(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _activityCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE7E3D8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: color, size: 23),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: ink,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            const Row(
              children: [
                Text(
                  'Start',
                  style: TextStyle(color: Color(0xFF77776D), fontSize: 10),
                ),
                SizedBox(width: 3),
                Icon(Icons.arrow_forward, color: Color(0xFF77776D), size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}