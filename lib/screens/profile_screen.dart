import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color cream = Color(0xFFFDF9EE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color sage = Color(0xFF51634E);
  static const Color sageDark = Color(0xFF394B38);
  static const Color sageLight = Color(0xFFD3E8CE);
  static const Color terracotta = Color(0xFF974731);
  static const Color ink = Color(0xFF1C1C15);
  static const Color muted = Color(0xFF77776D);
  static const Color border = Color(0xFFE7E3D8);

  String _name = 'User';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      if (!mounted) return;

      setState(() {
        _name = 'User';
        _loading = false;
      });

      return;
    }

    try {
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data()!;

        String name = 'User';

        if (data['name'] != null &&
            data['name'].toString().trim().isNotEmpty) {
          name = data['name'].toString();
        } else if (user.displayName != null &&
            user.displayName!.trim().isNotEmpty) {
          name = user.displayName!;
        }

        if (!mounted) return;

        setState(() {
          _name = name;
          _loading = false;
        });
      } else {
        if (!mounted) return;

        setState(() {
          _name = user.displayName?.isNotEmpty == true
              ? user.displayName!
              : 'User';
          _loading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _name = user.displayName?.isNotEmpty == true
            ? user.displayName!
            : 'User';
        _loading = false;
      });
    }
  }

  void _comingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This feature is coming soon'),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  void _callEmergency(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Emergency contact: Raj (Son) - +91 98765 00000',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ink,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: ink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            8,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: border,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: sageLight,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: sageDark,
                        size: 52,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: sageDark,
                            ),
                          )
                        : Text(
                            _name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ink,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                    const SizedBox(height: 4),

                    const Text(
                      'Patient',
                      style: TextStyle(
                        color: muted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // PERSONAL DETAILS
              const Text(
                'Personal Details',
                style: TextStyle(
                  color: ink,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _detailCard(
                icon: Icons.person_outline,
                title: 'Full Name',
                value: _loading ? 'Loading...' : _name,
              ),

              const SizedBox(height: 10),

              _detailCard(
                icon: Icons.cake_outlined,
                title: 'Age',
                value: '72 years',
              ),

              const SizedBox(height: 10),

              _detailCard(
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: '+91 98765 43210',
              ),

              const SizedBox(height: 10),

              _detailCard(
                icon: Icons.language,
                title: 'Language',
                value: 'Assamese',
              ),

              const SizedBox(height: 10),

              // EMERGENCY CONTACT
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: border,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: terracotta.withValues(
                          alpha: .11,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Icon(
                        Icons.emergency_outlined,
                        color: terracotta,
                        size: 23,
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emergency Contact',
                            style: TextStyle(
                              color: muted,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Raj (Son)',
                            style: TextStyle(
                              color: ink,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '+91 98765 00000',
                            style: TextStyle(
                              color: muted,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        _callEmergency(context);
                      },
                      icon: const Icon(
                        Icons.call,
                        color: sageDark,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ACCOUNT
              const Text(
                'Account',
                style: TextStyle(
                  color: ink,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _actionButton(
                icon: Icons.edit_outlined,
                title: 'Edit Profile',
                onTap: () {
                  _comingSoon(context);
                },
              ),

              const SizedBox(height: 10),

              _actionButton(
                icon: Icons.swap_horiz,
                title: 'Switch to Caregiver View',
                onTap: () {
                  _comingSoon(context);
                },
              ),

              const SizedBox(height: 10),

              _actionButton(
                icon: Icons.logout,
                title: 'Logout',
                iconColor: terracotta,
                textColor: terracotta,
                onTap: () {
                  _logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: sageLight,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: sageDark,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: muted,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: ink,
                    fontSize: 16,
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

  Widget _actionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = sageDark,
    Color textColor = ink,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: border,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 23,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              color: muted,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}