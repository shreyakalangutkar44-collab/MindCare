import 'package:flutter/material.dart';

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});

  @override
  State<MedicationsScreen> createState() =>
      _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color background = Color(0xFFFDF9EE);
  static const Color cardColor = Color(0xFFFFFCF5);

  static const Color coral = Color(0xFFFF927D);
  static const Color brown = Color(0xFF9E4826);
  static const Color darkBrown = Color(0xFF8D3F20);

  static const Color red = Color(0xFFC9161C);

  static const Color green = Color(0xFF4E654D);
  static const Color lightGreen = Color(0xFFDDEBD8);

  static const Color textDark = Color(0xFF171714);
  static const Color textGrey = Color(0xFF77756E);

  // ============================================================
  // MEDICATION DATA
  // ============================================================

  final List<Map<String, dynamic>> medications = [
    {
      'name': 'Amlodipine',
      'category': 'Blood Pressure',
      'time': '09:00 AM',
      'dose': '1 Tablet',
      'status': 'pending',
      'icon': Icons.access_time_filled,
    },
    {
      'name': 'Donepezil',
      'category': 'Missed',
      'time': '08:00 AM',
      'dose': '1 Tablet',
      'status': 'missed',
      'icon': Icons.priority_high_rounded,
    },
    {
      'name': 'Multi-vitamin',
      'category': 'Taken',
      'time': '07:30 AM',
      'dose': '1 Capsule',
      'status': 'taken',
      'icon': Icons.check_circle,
    },
  ];

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  48,
                  25,
                  48,
                  35,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _buildTitle(),

                    const SizedBox(height: 14),

                    _buildMedicationList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
    return Container(
      height: 37,
      decoration: const BoxDecoration(
        color: background,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8E4D9),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 49),

          GestureDetector(
            onTap: () {
              _openMenu();
            },
            child: const Icon(
              Icons.menu,
              size: 18,
              color: Color(0xFF566152),
            ),
          ),

          const Spacer(),

          const Text(
            'MindCare Caregiver',
            style: TextStyle(
              color: brown,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E5DB),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Color(0xFF687063),
              size: 14,
            ),
          ),

          const SizedBox(width: 72),
        ],
      ),
    );
  }

  // ============================================================
  // PAGE TITLE
  // ============================================================

  Widget _buildTitle() {
    return const Text(
      'Manage Care',
      style: TextStyle(
        color: textDark,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ============================================================
  // MEDICATION LIST
  // ============================================================

  Widget _buildMedicationList() {
    return Column(
      children: [
        for (int i = 0; i < medications.length; i++) ...[
          _buildMedicationCard(
            medications[i],
            i,
          ),
          if (i != medications.length - 1)
            const SizedBox(height: 12),
        ],
      ],
    );
  }

  // ============================================================
  // MEDICATION CARD
  // ============================================================

  Widget _buildMedicationCard(
    Map<String, dynamic> medication,
    int index,
  ) {
    final String status = medication['status'];

    if (status == 'missed') {
      return _buildMissedCard(
        medication,
        index,
      );
    }

    if (status == 'taken') {
      return _buildTakenCard(
        medication,
        index,
      );
    }

    return _buildPendingCard(
      medication,
      index,
    );
  }

  // ============================================================
  // PENDING MEDICATION
  // ============================================================

  Widget _buildPendingCard(
    Map<String, dynamic> medication,
    int index,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        18,
        16,
        15,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFEDE8DB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildIconCircle(
                icon: medication['icon'],
                backgroundColor: coral,
                iconColor: darkBrown,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication['name'],
                      style: const TextStyle(
                        color: textDark,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      medication['category'],
                      style: const TextStyle(
                        color: Color(0xFF4D514B),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [
                  Text(
                    medication['time'],
                    style: const TextStyle(
                      color: brown,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    medication['dose'],
                    style: const TextStyle(
                      color: textGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          _buildTakeButton(
            text: 'Mark as Taken',
            color: brown,
            icon: Icons.check_circle_outline,
            onPressed: () {
              _markAsTaken(index);
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MISSED MEDICATION
  // ============================================================

  Widget _buildMissedCard(
    Map<String, dynamic> medication,
    int index,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        18,
        16,
        15,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFFFC9C2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 128,
            decoration: const BoxDecoration(
              color: red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13),
                bottomLeft: Radius.circular(13),
              ),
            ),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildIconCircle(
                      icon: medication['icon'],
                      backgroundColor:
                          const Color(0xFFFFD7D7),
                      iconColor: red,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            medication['name'],
                            style: const TextStyle(
                              color: textDark,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            'Missed',
                            style: TextStyle(
                              color: red,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      children: [
                        Text(
                          medication['time'],
                          style: const TextStyle(
                            color: red,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text(
                          medication['dose'],
                          style: const TextStyle(
                            color: textGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                _buildTakeButton(
                  text: 'Mark as Taken Now',
                  color: red,
                  icon: Icons.warning_amber_rounded,
                  onPressed: () {
                    _markAsTaken(index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TAKEN MEDICATION
  // ============================================================

  Widget _buildTakenCard(
    Map<String, dynamic> medication,
    int index,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFC6D7BF),
        ),
      ),
      child: Row(
        children: [
          _buildIconCircle(
            icon: Icons.check_circle,
            backgroundColor: lightGreen,
            iconColor: green,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  medication['name'],
                  style: const TextStyle(
                    color: Color(0xFF66655E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration:
                        TextDecoration.lineThrough,
                    decorationColor:
                        Color(0xFF66655E),
                  ),
                ),

                const SizedBox(height: 3),

                const Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: green,
                      size: 13,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Taken',
                      style: TextStyle(
                        color: green,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Text(
                medication['time'],
                style: const TextStyle(
                  color: textGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                medication['dose'],
                style: const TextStyle(
                  color: textGrey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ICON CIRCLE
  // ============================================================

  Widget _buildIconCircle({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      width: 33,
      height: 33,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }

  // ============================================================
  // ACTION BUTTON
  // ============================================================

  Widget _buildTakeButton({
    required String text,
    required Color color,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 17,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black.withValues(
            alpha: 0.18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MARK MEDICATION AS TAKEN
  // ============================================================

  void _markAsTaken(int index) {
    setState(() {
      medications[index]['status'] = 'taken';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${medications[index]['name']} marked as taken',
        ),
        backgroundColor: green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ============================================================
  // MENU
  // ============================================================

  void _openMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              12,
              20,
              20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                const ListTile(
                  leading: Icon(
                    Icons.medication_outlined,
                    color: brown,
                  ),
                  title: Text(
                    'Medications',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const ListTile(
                  leading: Icon(
                    Icons.dashboard_outlined,
                    color: green,
                  ),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }
}