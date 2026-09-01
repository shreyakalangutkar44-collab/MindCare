import 'package:flutter/material.dart';
import 'patient_progress.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  static const Color cream = Color(0xFFFDF9EE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceContainer = Color(0xFFF1EEE3);
  static const Color sage = Color(0xFF51634E);
  static const Color sageDark = Color(0xFF394B38);
  static const Color sageLight = Color(0xFFD3E8CE);
  static const Color terracotta = Color(0xFF974731);
  static const Color yellow = Color(0xFFCCA72F);
  static const Color ink = Color(0xFF1C1C15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Patient Profile',
          style: TextStyle(
            color: ink,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showEditDialog(context);
            },
            icon: const Icon(
              Icons.edit_outlined,
              color: sage,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          8,
          20,
          35,
        ),
        child: Column(
          children: [
            _buildProfileHeader(),

            const SizedBox(height: 20),

            _buildPersonalInformation(),

            const SizedBox(height: 16),

            _buildHealthInformation(),

            const SizedBox(height: 16),

            _buildCareInformation(),

            const SizedBox(height: 16),

            _buildEmergencyContact(),

            const SizedBox(height: 20),

            _buildActionButtons(context),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PROFILE HEADER
  // ============================================================

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: surfaceContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: sage.withValues(alpha: 0.15),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: ink.withValues(alpha: 0.07),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: sageLight,
                  border: Border.all(
                    color: cream,
                    width: 5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ink.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 64,
                  color: sageDark,
                ),
              ),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: sage,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: surfaceContainer,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Text(
            'Mrs. Anita Sharma',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ink,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Patient',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 11),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: sageLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 9,
                  color: Color(0xFF4E8B50),
                ),
                SizedBox(width: 7),
                Text(
                  'Active',
                  style: TextStyle(
                    color: sageDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
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
          icon: Icons.cake_outlined,
          title: 'Age',
          value: '68 years',
        ),
        _divider(),
        _infoRow(
          icon: Icons.wc_outlined,
          title: 'Gender',
          value: 'Female',
        ),
        _divider(),
        _infoRow(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: 'Guwahati, Assam',
        ),
      ],
    );
  }

  // ============================================================
  // HEALTH INFORMATION
  // ============================================================

  Widget _buildHealthInformation() {
    return _sectionCard(
      title: 'Health Information',
      icon: Icons.favorite_outline,
      children: [
        _infoRow(
          icon: Icons.monitor_heart_outlined,
          title: 'Current Status',
          value: 'Stable',
          valueColor: sage,
        ),
        _divider(),
        _infoRow(
          icon: Icons.psychology_outlined,
          title: 'Cognitive Activity',
          value: 'Good',
          valueColor: sage,
        ),
        _divider(),
        _infoRow(
          icon: Icons.calendar_month_outlined,
          title: 'Care Started',
          value: 'January 2026',
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
          icon: Icons.person_outline,
          title: 'Primary Caregiver',
          value: 'Family Caregiver',
        ),
        _divider(),
        _infoRow(
          icon: Icons.access_time_outlined,
          title: 'Care Schedule',
          value: 'Daily',
        ),
        _divider(),
        _infoRow(
          icon: Icons.medication_outlined,
          title: 'Medications',
          value: '3 Active',
          valueColor: terracotta,
        ),
      ],
    );
  }

  // ============================================================
  // EMERGENCY CONTACT
  // ============================================================

  Widget _buildEmergencyContact() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0DC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: terracotta.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.contact_phone_outlined,
              color: terracotta,
              size: 23,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency Contact',
                  style: TextStyle(
                    color: Color(0xFF7D3021),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Primary family contact available',
                  style: TextStyle(
                    color: Color(0xFF7D3021),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.phone_outlined,
              color: terracotta,
              size: 19,
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
      padding: const EdgeInsets.fromLTRB(
        18,
        18,
        18,
        10,
      ),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE8E4D9),
        ),
        boxShadow: [
          BoxShadow(
            color: ink.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  color: sageLight,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  icon,
                  color: sageDark,
                  size: 21,
                ),
              ),

              const SizedBox(width: 11),

              Text(
                title,
                style: const TextStyle(
                  color: ink,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          ...children,
        ],
      ),
    );
  }

  // ============================================================
  // INFORMATION ROW
  // ============================================================

  Widget _infoRow({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey.shade600,
            size: 20,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
            ),
          ),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: valueColor ?? ink,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  // ============================================================
  // ACTION BUTTONS
  // ============================================================

  Widget _buildActionButtons(
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton.icon(
            onPressed: () {
              _showEditDialog(context);
            },
            icon: const Icon(
              Icons.edit_outlined,
              size: 20,
            ),
            label: const Text(
              'Edit Patient Information',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: terracotta,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        const SizedBox(height: 11),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton.icon(
            onPressed: () {
              _showNotesDialog(context);
            },
            icon: const Icon(
              Icons.note_alt_outlined,
              size: 20,
            ),
            label: const Text(
              'Care Notes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: sageDark,
              side: const BorderSide(
                color: sage,
                width: 1.4,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        const SizedBox(height: 11),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PatientProgressScreen(),
                ),
              );
            },
            icon: const Icon(Icons.bar_chart_outlined, size: 20),
            label: const Text(
              'View Patient Progress',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: sageDark,
              side: const BorderSide(color: sage, width: 1.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // EDIT DIALOG
  // ============================================================

  void _showEditDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cream,
          title: const Text(
            'Edit Patient Information',
            style: TextStyle(
              color: ink,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Patient information editing can be connected to your database or form later.',
            style: TextStyle(
              color: Color(0xFF55554D),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: sageDark,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // CARE NOTES DIALOG
  // ============================================================

  void _showNotesDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cream,
          title: const Text(
            'Care Notes',
            style: TextStyle(
              color: ink,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Caregiver notes can be added here.',
            style: TextStyle(
              color: Color(0xFF55554D),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: sageDark,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}