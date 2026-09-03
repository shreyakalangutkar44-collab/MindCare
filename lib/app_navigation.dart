
import 'package:flutter/material.dart';

import 'patient_profile.dart';
import 'screens/patient_progress.dart' as progress;
import 'medications.dart';
import 'chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/database_service.dart';
import 'screens/add_memory_photo_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() =>
      _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int selectedIndex = 0;

  final Color background = const Color(0xFFFDF9EE);
  final Color brown = const Color(0xFF974731);
  final Color sage = const Color(0xFF51634E);
  final Color sageLight = const Color(0xFFD3E8CE);
  final Color textDark = const Color(0xFF1C1C15);
  final Color darkRed = const Color(0xFF7D3021);

  late final List<Widget> pages = [
    const CaregiverDashboardPage(),

    // Patient progress screen
    const progress.PatientProgressScreen(),

    const MedicationsScreen(),
    const ChatsScreen(),
    const PatientProfileScreen(),
  ];

  // ============================================================
  // NAVIGATION
  // ============================================================

  void goToPage(int index) {
    if (index < 0 || index >= pages.length) {
      return;
    }

    if (selectedIndex == index) {
      return;
    }

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),

          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,

            children: [
              _navItem(
                index: 0,
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'Home',
              ),

              _navItem(
                index: 1,
                icon: Icons.insights_outlined,
                activeIcon: Icons.insights,
                label: 'Progress',
              ),

              _navItem(
                index: 2,
                icon: Icons.medication_outlined,
                activeIcon: Icons.medication,
                label: 'Medication',
              ),

              _navItem(
                index: 3,
                icon: Icons.chat_bubble_outline,
                activeIcon: Icons.chat_bubble,
                label: 'Chats',
              ),

              _navItem(
                index: 4,
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final bool active = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          goToPage(index);
        },

        behavior: HitTestBehavior.opaque,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),

          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 5,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              AnimatedContainer(
                duration:
                    const Duration(milliseconds: 180),

                width: active ? 48 : 42,
                height: 34,

                decoration: BoxDecoration(
                  color: active
                      ? sageLight
                      : Colors.transparent,

                  borderRadius:
                      BorderRadius.circular(17),
                ),

                child: Icon(
                  active ? activeIcon : icon,
                  size: 21,
                  color: active
                      ? sage
                      : Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  color: active
                      ? sage
                      : Colors.grey.shade600,

                  fontSize: 10,

                  fontWeight: active
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CAREGIVER DASHBOARD
// ============================================================

class CaregiverDashboardPage extends StatelessWidget {
  const CaregiverDashboardPage({super.key});

  static const Color cream =
      Color(0xFFFDF9EE);

  static const Color surface =
      Color(0xFFFFFFFF);

  static const Color sage =
      Color(0xFF51634E);

  static const Color sageDark =
      Color(0xFF394B38);

  static const Color sageLight =
      Color(0xFFD3E8CE);

  static const Color terracotta =
      Color(0xFF974731);

  static const Color ink =
      Color(0xFF1C1C15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            18,
            20,
            30,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              _buildHeader(),

              const SizedBox(height: 22),

              _buildWelcomeCard(),

              const SizedBox(height: 20),

              const Text(
                'Today',
                style: TextStyle(
                  color: ink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _buildTodayCard(),

              const SizedBox(height: 20),

              const Text(
                'Quick Access',
                style: TextStyle(
                  color: ink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _buildQuickAccess(context),

              const SizedBox(height: 12),

              _buildAddPhotoCard(context),

              const SizedBox(height: 20),

              _buildPatientOverview(),

              const SizedBox(height: 20),

              _buildCareTip(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,

          decoration: BoxDecoration(
            color: sageLight,
            borderRadius:
                BorderRadius.circular(15),
          ),

          child: const Icon(
            Icons.health_and_safety_outlined,
            color: sageDark,
            size: 26,
          ),
        ),

        const SizedBox(width: 12),

        const Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                'MindCare',
                style: TextStyle(
                  color: sageDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 2),

              Text(
                'Caregiver Dashboard',
                style: TextStyle(
                  color: Color(0xFF77776D),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 43,
          height: 43,

          decoration: BoxDecoration(
            color: surface,
            borderRadius:
                BorderRadius.circular(14),

            border: Border.all(
              color: const Color(0xFFE7E3D8),
            ),
          ),

          child: const Icon(
            Icons.notifications_none_outlined,
            color: sageDark,
            size: 23,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // WELCOME CARD
  // ============================================================

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(21),

      decoration: BoxDecoration(
        color: sageDark,
        borderRadius:
            BorderRadius.circular(23),

        boxShadow: [
          BoxShadow(
            color: ink.withValues(alpha: .12),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            'Good day, Caregiver 🌿',

            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Here is your patient care overview for today.',

            style: TextStyle(
              color: Color(0xFFDCE8D8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TODAY CARD
  // ============================================================

  Widget _buildTodayCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: surface,
        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: const Color(0xFFE7E3D8),
        ),
      ),

      child: Column(
        children: [
          _dashboardRow(
            icon: Icons.medication_outlined,
            title: 'Medications',
            subtitle: '3 medications today',
            color: terracotta,
          ),

          Divider(
            height: 22,
            color: Colors.grey.shade200,
          ),

          _dashboardRow(
            icon: Icons.psychology_outlined,
            title: 'Cognitive Activity',
            subtitle: '2 activities completed',
            color: sage,
          ),

          Divider(
            height: 22,
            color: Colors.grey.shade200,
          ),

          _dashboardRow(
            icon: Icons.chat_bubble_outline,
            title: 'Messages',
            subtitle: '2 new messages',
            color: sageDark,
          ),
        ],
      ),
    );
  }

  Widget _dashboardRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,

          decoration: BoxDecoration(
            color: color.withValues(alpha: .11),
            borderRadius:
                BorderRadius.circular(13),
          ),

          child: Icon(
            icon,
            color: color,
            size: 22,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  color: ink,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                subtitle,

                style: const TextStyle(
                  color: Color(0xFF77776D),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

        Icon(
          Icons.chevron_right,
          color: Colors.grey.shade500,
          size: 21,
        ),
      ],
    );
  }

  // ============================================================
  // QUICK ACCESS
  // ============================================================

  Future<void> _openAddPhoto(BuildContext context) async {
    final patients =
        await DatabaseService().getAllPatientUsers();

    if (!context.mounted) return;

    if (patients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No patient accounts found yet.',
          ),
        ),
      );

      return;
    }

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) =>
            AddMemoryPhotoScreen(
              patientId: patients.first['id'],
            ),
      ),
    );
  }

  Widget _buildAddPhotoCard(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => _openAddPhoto(context),

      borderRadius:
          BorderRadius.circular(18),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(17),

        decoration: BoxDecoration(
          color: surface,

          borderRadius:
              BorderRadius.circular(18),

          border: Border.all(
            color: const Color(0xFFE7E3D8),
          ),
        ),

        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,

              decoration: BoxDecoration(
                color:
                    terracotta.withValues(alpha: .11),

                borderRadius:
                    BorderRadius.circular(13),
              ),

              child: const Icon(
                Icons.add_a_photo_outlined,
                color: terracotta,
                size: 22,
              ),
            ),

            const SizedBox(width: 12),

            const Expanded(
              child: Text(
                'Add Memory Photo',

                style: TextStyle(
                  color: ink,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade500,
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccess(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          child: _quickCard(
            icon: Icons.medication_outlined,
            title: 'Medication',
            color: terracotta,

            onTap: () {
              final state = context
                  .findAncestorStateOfType<
                      _AppNavigationState>();

              state?.goToPage(2);
            },
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _quickCard(
            icon: Icons.chat_bubble_outline,
            title: 'Chats',
            color: sage,

            onTap: () {
              final state = context
                  .findAncestorStateOfType<
                      _AppNavigationState>();

              state?.goToPage(3);
            },
          ),
        ),
      ],
    );
  }

  Widget _quickCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(18),

      child: Container(
        padding: const EdgeInsets.all(17),

        decoration: BoxDecoration(
          color: surface,

          borderRadius:
              BorderRadius.circular(18),

          border: Border.all(
            color: const Color(0xFFE7E3D8),
          ),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Container(
              width: 44,
              height: 44,

              decoration: BoxDecoration(
                color:
                    color.withValues(alpha: .11),

                borderRadius:
                    BorderRadius.circular(13),
              ),

              child: Icon(
                icon,
                color: color,
                size: 23,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,

              style: const TextStyle(
                color: ink,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 3),

            const Row(
              children: [
                Text(
                  'Open',

                  style: TextStyle(
                    color: Color(0xFF77776D),
                    fontSize: 10,
                  ),
                ),

                SizedBox(width: 3),

                Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF77776D),
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PATIENT OVERVIEW
  // ============================================================

  Widget _buildPatientOverview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),

      decoration: BoxDecoration(
        color: const Color(0xFFF1EEE3),
        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,

            decoration: BoxDecoration(
              color: sageLight,
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.person,
              color: sageDark,
              size: 32,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  'Arunjyoti Baruah',

                  style: TextStyle(
                    color: ink,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Patient • Stable condition',

                  style: TextStyle(
                    color: Color(0xFF77776D),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),

            decoration: BoxDecoration(
              color: sageLight,
              borderRadius:
                  BorderRadius.circular(15),
            ),

            child: const Text(
              'Stable',

              style: TextStyle(
                color: sageDark,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CARE TIP
  // ============================================================

  Widget _buildCareTip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: const Color(0xFFFFF4D7),

        borderRadius:
            BorderRadius.circular(19),

        border: Border.all(
          color: const Color(0xFFF0E1B9),
        ),
      ),

      child: const Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Icon(
            Icons.lightbulb_outline,
            color: Color(0xFF9A7A1C),
            size: 23,
          ),

          SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  'Care Tip',

                  style: TextStyle(
                    color: Color(0xFF735E18),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Encourage regular cognitive activities and maintain a calm daily routine.',

                  style: TextStyle(
                    color: Color(0xFF806D2A),
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
