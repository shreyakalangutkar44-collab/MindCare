import 'package:flutter/material.dart';

import 'speech_service.dart';
import 'tts_service.dart';

class VoiceDiaryScreen extends StatefulWidget {
  const VoiceDiaryScreen({super.key});

  @override
  State<VoiceDiaryScreen> createState() => _VoiceDiaryScreenState();
}

class _VoiceDiaryScreenState extends State<VoiceDiaryScreen> {
  final SpeechService _speechService = SpeechService();
  final TtsService _ttsService = TtsService();

  String _diaryText = '';
  bool _isListening = false;

  final List<String> _memories = [];

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    await _speechService.initialize();
  }

  Future<void> _startListening() async {
    setState(() {
      _isListening = true;
    });

    await _speechService.startListening(
      language: 'en-IN',
      onResult: (text) {
        if (!mounted) {
          return;
        }

        setState(() {
          _diaryText = text;
        });
      },
    );
  }

  Future<void> _stopListening() async {
    await _speechService.stopListening();

    if (!mounted) {
      return;
    }

    setState(() {
      _isListening = false;
    });
  }

  void _saveMemory() {
    if (_diaryText.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please speak something first.'),
        ),
      );
      return;
    }

    setState(() {
      _memories.insert(0, _diaryText.trim());
      _diaryText = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Memory saved successfully!'),
      ),
    );
  }

  Future<void> _readMemory(String memory) async {
    await _ttsService.speakEnglish(memory);
  }

  @override
  void dispose() {
    _speechService.stopListening();
    _ttsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9EE),
      appBar: AppBar(
        title: const Text(
          'Voice Diary',
          style: TextStyle(
            color: Color(0xFF1C1C15),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFDF9EE),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF51634E),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 15),

              const Icon(
                Icons.menu_book,
                size: 70,
                color: Color(0xFF51634E),
              ),

              const SizedBox(height: 15),

              const Text(
                'Tell Me About Your Day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C1C15),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Speak about your day, a memory, '
                'or something special you want to remember.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.4,
                  color: Color(0xFF434841),
                ),
              ),

              const SizedBox(height: 30),

              GestureDetector(
                onTap: _isListening
                    ? _stopListening
                    : _startListening,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: _isListening
                        ? const Color(0xFFBA1A1A)
                        : const Color(0xFF974731),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    _isListening ? Icons.stop : Icons.mic,
                    color: Colors.white,
                    size: 55,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                _isListening
                    ? 'Listening... Tap to stop'
                    : 'Tap the microphone to speak',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF974731),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFC4C8BF),
                  ),
                ),
                child: Text(
                  _diaryText.isEmpty
                      ? 'Your spoken memory will appear here...'
                      : _diaryText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: _diaryText.isEmpty
                        ? const Color(0xFF72766F)
                        : const Color(0xFF1C1C15),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: _saveMemory,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save Memory',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF51634E),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Memories',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1C15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              if (_memories.isEmpty)
                const Text(
                  'No memories saved yet.',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF72766F),
                  ),
                ),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _memories.length,
                itemBuilder: (context, index) {
                  final memory = _memories[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFC4C8BF),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 27,
                          backgroundColor: Color(0xFFE5E9E0),
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFF974731),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            memory,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.4,
                              color: Color(0xFF1C1C15),
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            _readMemory(memory);
                          },
                          icon: const Icon(
                            Icons.volume_up,
                            size: 32,
                            color: Color(0xFF51634E),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}