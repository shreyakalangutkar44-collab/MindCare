import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/database_service.dart';
import '../models/personalized_photo.dart';

class AddMemoryPhotoScreen extends StatefulWidget {
  final String patientId;

  const AddMemoryPhotoScreen({super.key, required this.patientId});

  @override
  State<AddMemoryPhotoScreen> createState() => _AddMemoryPhotoScreenState();
}

class _AddMemoryPhotoScreenState extends State<AddMemoryPhotoScreen> {
  final DatabaseService _dbService = DatabaseService();
  final TextEditingController _labelController = TextEditingController();

  Uint8List? _selectedImageBytes;
  bool _isSaving = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      imageQuality: 70,
    );

    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _selectedImageBytes = bytes;
      });
    }
  }

  Future<void> _save() async {
    if (_selectedImageBytes == null || _labelController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick a photo and add a label')),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final base64Image = _dbService.encodeImageToBase64(_selectedImageBytes!);

      final photo = PersonalizedPhoto(
        id: '',
        patientId: widget.patientId,
        imageBase64: base64Image,
        label: _labelController.text.trim(),
        uploadedAt: DateTime.now(),
      );

      await _dbService.savePersonalizedPhoto(photo);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Photo saved!')),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }

    if (mounted) setState(() => _isSaving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF9EE),
        elevation: 0,
        title: const Text(
          'Add Memory Photo',
          style: TextStyle(color: Color(0xFF51634E), fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF51634E)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1EEE3),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE6E2D8)),
                  ),
                  child: _selectedImageBytes == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, size: 50, color: Color(0xFF51634E)),
                            SizedBox(height: 10),
                            Text(
                              'Tap to choose a photo',
                              style: TextStyle(color: Color(0xFF51634E)),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.memory(_selectedImageBytes!, fit: BoxFit.cover),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _labelController,
                decoration: InputDecoration(
                  labelText: 'Who or what is this? (e.g. "Your son Raj")',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF51634E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _isSaving
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Save Photo',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}