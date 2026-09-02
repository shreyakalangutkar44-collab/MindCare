import 'package:flutter/material.dart';
import 'speech_service.dart';
import 'tts_service.dart';

class Companion extends StatefulWidget {
  const Companion({super.key});

  @override
  State<Companion> createState() => _CompanionState();
}

class _CompanionState extends State<Companion> {
  final SpeechService _speechService = SpeechService();
  final TtsService _ttsService = TtsService();

  final TextEditingController _messageController =
      TextEditingController();

  final List<Map<String, String>> _messages = [];

  bool _isListening = false;

  @override
  void initState() {
    super.initState();

    _initializeSpeech();

    _messages.add({
      'sender': 'companion',
      'text':
          'Hello! I am your MindCare companion. How can I help you today?',
    });
  }

  Future<void> _initializeSpeech() async {
    await _speechService.initialize();
  }

  Future<void> _startVoiceInput() async {
    setState(() {
      _isListening = true;
    });

    await _speechService.startListening(
      onResult: (String text) {
        if (!mounted) return;

        setState(() {
          _messageController.text = text;
          _messageController.selection =
              TextSelection.fromPosition(
            TextPosition(
              offset: _messageController.text.length,
            ),
          );
        });
      },
      language: 'en-IN',
    );
  }

  Future<void> _stopVoiceInput() async {
    await _speechService.stopListening();

    if (!mounted) return;

    setState(() {
      _isListening = false;
    });
  }

  Future<void> _sendMessage() async {
    final String message =
        _messageController.text.trim();

    if (message.isEmpty) {
      return;
    }

    setState(() {
      _messages.add({
        'sender': 'user',
        'text': message,
      });

      _messageController.clear();
    });

    final String response =
        _getCompanionResponse(message);

    setState(() {
      _messages.add({
        'sender': 'companion',
        'text': response,
      });
    });

    await _ttsService.speak(response);
  }

  String _getCompanionResponse(String message) {
    final String text = message.toLowerCase();

    if (text.contains('game') ||
        text.contains('play') ||
        text.contains('activity')) {
      return 'You can try a memory game or a pattern game. Choose whichever you like.';
    }

    if (text.contains('medicine') ||
        text.contains('tablet')) {
      return 'Please check your medicine reminder for the next scheduled medicine.';
    }

    if (text.contains('diary') ||
        text.contains('today') ||
        text.contains('memory')) {
      return 'You can record something about your day using your Voice Diary.';
    }

    if (text.contains('progress') ||
        text.contains('score') ||
        text.contains('performance')) {
      return 'You can check your progress section to see your recent activity and scores.';
    }

    if (text.contains('hello') ||
        text.contains('hi') ||
        text.contains('namaste')) {
      return 'Hello! It is nice to talk with you. How are you feeling today?';
    }

    if (text.contains('help')) {
      return 'I can help you find an activity, use your diary, check reminders, or view your progress.';
    }

    return 'That sounds interesting. You can ask me about games, your diary, medicine, or your progress.';
  }

  Future<void> _speakLastResponse() async {
    final List<Map<String, String>>
        companionMessages = _messages
            .where(
              (message) =>
                  message['sender'] == 'companion',
            )
            .toList();

    if (companionMessages.isEmpty) {
      return;
    }

    final String lastResponse =
        companionMessages.last['text']!;

    await _ttsService.speak(lastResponse);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _ttsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MindCare Companion'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _speakLastResponse,
            icon: const Icon(Icons.volume_up),
            tooltip: 'Speak response',
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                final Map<String, String> message =
                    _messages[index];

                final bool isUser =
                    message['sender'] == 'user';

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    padding: const EdgeInsets.all(14),
                    constraints: BoxConstraints(
                      maxWidth:
                          MediaQuery.of(context).size.width *
                              0.78,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(16),
                      color: isUser
                          ? Theme.of(context)
                              .colorScheme
                              .primaryContainer
                          : Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                    ),
                    child: Text(
                      message['text']!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                8,
                12,
                12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                          _messageController,
                      textInputAction:
                          TextInputAction.send,
                      onSubmitted: (_) =>
                          _sendMessage(),
                      decoration: InputDecoration(
                        hintText:
                            'Talk to your companion...',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  IconButton(
                    onPressed: _isListening
                        ? _stopVoiceInput
                        : _startVoiceInput,
                    icon: Icon(
                      _isListening
                          ? Icons.stop_circle
                          : Icons.mic,
                    ),
                    iconSize: 32,
                  ),

                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                    iconSize: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}