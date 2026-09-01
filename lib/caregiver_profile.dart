import 'package:flutter/material.dart';

class CaregiverProfileScreen extends StatelessWidget {
  const CaregiverProfileScreen({super.key});

  static const Color background = Color(0xFFFDF9EE);
  static const Color cardColor = Color(0xFFFFFCF5);
  static const Color coral = Color(0xFFFF927D);
  static const Color brown = Color(0xFF9E4826);
  static const Color darkBrown = Color(0xFF8D3F20);
  static const Color sage = Color(0xFF51634E);
  static const Color sageLight = Color(0xFFDDEBD8);
  static const Color textDark = Color(0xFF171714);
  static const Color textGrey = Color(0xFF77756E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  48,
                  25,
                  48,
                  30,
                ),
                child: Column(
                  children: [
                    _buildProfileHeader(),

                    const SizedBox(height: 20),

                    _buildPersonalInformation(),

                    const SizedBox(height: 16),

                    _buildCareInformation(),

                    const SizedBox(height: 16),

                    _buildPatientsCard(),

                    const SizedBox(height: 20),

                    _buildEditButton(context),
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
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        color: background,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8E4D9),
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 48),

          IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: sage,
            ),
          ),

          const Spacer(),

          const Text(
            'Caregiver Profile',
            style: TextStyle(
              color: brown,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          const SizedBox(width: 48),
        ],
      ),
    );
  }

  // ============================================================
  // PROFILE HEADER
  // ============================================================

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE7E2D6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: const BoxDecoration(
              color: sageLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: sage,
              size: 43,
            ),
          ),

          const SizedBox(height: 13),

          const Text(
            'Sarah Johnson',
            style: TextStyle(
              color: textDark,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Caregiver',
            style: TextStyle(
              color: sage,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 9),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: sageLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_outlined,
                  color: sage,
                  size: 14,
                ),
                SizedBox(width: 5),
                Text(
                  'Active Caregiver',
                  style: TextStyle(
                    color: sage,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PERSONAL INFORMATION
  // ============================================================

  Widget _buildPersonalInformation() {
    return _sectionCard(
      title: 'Personal Information',
      icon: Icons.person_outline,
      children: [
        _infoRow(
          Icons.person_outline,
          'Full Name',
          'Sarah Johnson',
        ),
        _divider(),
        _infoRow(
          Icons.email_outlined,
          'Email',
          'sarah.johnson@example.com',
        ),
        _divider(),
        _infoRow(
          Icons.phone_outlined,
          'Phone',
          '+1 555 123 4567',
        ),
      ],
    );
  }

  // ============================================================
  // CARE INFORMATION
  // ============================================================

  Widget _buildCareInformation() {
    return _sectionCard(
      title: 'Care Information',
      icon: Icons.health_and_safety_outlined,
      children: [
        _infoRow(
          Icons.people_outline,
          'Patients',
          '2 Active Patients',
        ),
        _divider(),
        _infoRow(
          Icons.work_outline,
          'Experience',
          '5 Years',
        ),
        _divider(),
        _infoRow(
          Icons.access_time_outlined,
          'Care Hours',
          '08:00 AM - 06:00 PM',
        ),
      ],
    );
  }

  // ============================================================
  // PATIENTS
  // ============================================================

  Widget _buildPatientsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7E2D6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.people_outline,
                color: sage,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'My Patients',
                style: TextStyle(
                  color: textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          _patientRow(
            name: 'Mrs. Anita Sharma',
            status: 'Stable',
          ),
        ],
      ),
    );
  }

  Widget _patientRow({
    required String name,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5EC),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: sageLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: sage,
              size: 21,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: textDark,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: sageLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: sage,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION CARD
  // ============================================================

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7E2D6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: sage,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          ...children,
        ],
      ),
    );
  }

  // ============================================================
  // INFO ROW
  // ============================================================

  Widget _infoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: sageLight,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(
            icon,
            color: sage,
            size: 17,
          ),
        ),

        const SizedBox(width: 11),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: textGrey,
                  fontSize: 9,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  color: textDark,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        height: 1,
        color: Color(0xFFEDE8DC),
      ),
    );
  }

  // ============================================================
  // EDIT BUTTON
  // ============================================================

  Widget _buildEditButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          _showEditDialog(context);
        },
        icon: const Icon(
          Icons.edit_outlined,
          size: 18,
        ),
        label: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: coral,
          foregroundColor: darkBrown,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // EDIT DIALOG
  // ============================================================

  void _showEditDialog(BuildContext context) {
    final nameController =
        TextEditingController(text: 'Sarah Johnson');

    final emailController = TextEditingController(
      text: 'sarah.johnson@example.com',
    );

    final phoneController = TextEditingController(
      text: '+1 555 123 4567',
    );

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: sage,
                    ),
                    filled: true,
                    fillColor: background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: sage,
                    ),
                    filled: true,
                    fillColor: background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      color: sage,
                    ),
                    filled: true,
                    fillColor: background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: textGrey,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Profile updated successfully',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: coral,
                foregroundColor: darkBrown,
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}