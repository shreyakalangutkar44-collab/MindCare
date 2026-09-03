
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../games/memory_match/memory_match.dart';
import '../games/pattern_match_game.dart';
import '../games/story_memory/story_memory_game.dart';
import '../games/personalized_memory/personalized_memory_game.dart';
import '../voice/voice_diary.dart';
import '../voice/voice_recall.dart';

import 'profile_screen.dart';
import 'patient_progress.dart';

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
  static const Color yellow = Color(0xFFCCA72F);
  static const Color ink = Color(0xFF1C1C15);

  String _displayName = "Friend";
  bool _loadingName = true;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        if (mounted) {
          setState(() {
            _loadingName = false;
          });
        }
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final data = doc.data();

        if (data != null && data['name'] != null) {
          if (mounted) {
            setState(() {
              _displayName = data['name'].toString();
              _loadingName = false;
            });
          }
          return;
        }
      }

      if (mounted) {
        setState(() {
          _displayName = user.displayName ?? "Friend";
          _loadingName = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingName = false;
        });
      }
    }
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  void _onNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),

          // DASHBOARD / PROGRESS
          const PatientProgressScreen(),

          _buildReminderScreen(),

          const ProfileScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: sageDark,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onNavigationItemTapped,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: "Reminder",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ============================================================
  // REMINDER SCREEN
  // ============================================================

  Widget _buildReminderScreen() {
    return Scaffold(
      backgroundColor: cream,

      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Reminders",
          style: TextStyle(
            color: ink,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: const Center(
        child: Text(
          "Reminders will appear here.",
          style: TextStyle(
            fontSize: 20,
            color: ink,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HOME SCREEN
  // ============================================================

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          18,
          20,
          30,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ----------------------------------------------------
            // HEADER
            // ----------------------------------------------------

            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,

                  decoration: BoxDecoration(
                    color: sageLight,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: const Icon(
                    Icons.favorite_rounded,
                    color: sageDark,
                    size: 27,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      const Text(
                        "Namaste",
                        style: TextStyle(
                          fontSize: 14,
                          color: sage,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        _loadingName
                            ? "Welcome"
                            : "Hello, $_displayName",

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ink,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },

                  icon: const Icon(
                    Icons.person_outline_rounded,
                    size: 28,
                    color: sageDark,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ----------------------------------------------------
            // WELCOME CARD
            // ----------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                    color: Colors.black.withOpacity(0.06),
                  ),
                ],
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        const Text(
                          "A little practice\ncan make a big difference.",

                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            height: 1.25,
                            color: ink,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "Take your time and enjoy today's activities.",

                          style: TextStyle(
                            fontSize: 14,
                            color: ink.withOpacity(0.65),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    height: 70,
                    width: 70,

                    decoration: const BoxDecoration(
                      color: sageLight,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.psychology_alt_rounded,
                      size: 40,
                      color: sageDark,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ----------------------------------------------------
            // ACTIVITIES
            // ----------------------------------------------------

            const Text(
              "Today's Activities",

              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: ink,
              ),
            ),

            const SizedBox(height: 14),

            // MEMORY MATCH

            _activityCard(
              title: "Memory Match",
              subtitle: "Match the same cards",
              icon: Icons.grid_view_rounded,
              color: sageLight,
              iconColor: sageDark,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MemoryMatchGame(),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // PATTERN GAME

            _activityCard(
              title: "Pattern Game",
              subtitle: "Find the correct pattern",
              icon: Icons.extension_rounded,
              color: const Color(0xFFFFE8D9),
              iconColor: terracotta,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const PatternMatchGame(),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // TALK TO ME

            _activityCard(
              title: "Talk to Me",
              subtitle: "Talk about your day",
              icon: Icons.mic_rounded,
              color: const Color(0xFFFFF1C7),
              iconColor: yellow,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const VoiceDiaryScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // VOICE RECALL

            _activityCard(
              title: "Voice Recall",
              subtitle: "Listen and remember",
              icon: Icons.record_voice_over_rounded,
              color: const Color(0xFFE4E9F7),
              iconColor: const Color(0xFF52658F),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const VoiceRecall(),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // STORY MEMORY

            _activityCard(
              title: "Story Memory",
              subtitle: "Listen to a story and recall it",
              icon: Icons.menu_book_rounded,
              color: const Color(0xFFE7F0E4),
              iconColor: sageDark,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const StoryMemoryGame(),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // PERSONALIZED MEMORY

            _activityCard(
              title: "Personalized Memory",
              subtitle: "Remember familiar photos",
              icon: Icons.photo_library_rounded,
              color: const Color(0xFFF6E3E9),
              iconColor: const Color(0xFF98566C),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const PersonalizedMemoryGame(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ACTIVITY CARD
  // ============================================================

  Widget _activityCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(22),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.05),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              height: 58,
              width: 58,

              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: ink,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,

                    style: TextStyle(
                      fontSize: 13,
                      color: ink.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: sage,
            ),
          ],
        ),
      ),
    );
  }
}
