import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text, {String language = 'en-IN'}) async {
    if (text.trim().isEmpty) {
      return;
    }

    await _tts.setLanguage(language);
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);

    await _tts.speak(text);
  }

  Future<void> speakEnglish(String text) async {
    await speak(text, language: 'en-IN');
  }

  Future<void> speakHindi(String text) async {
    await speak(text, language: 'hi-IN');
  }

  Future<void> stop() async {
    await _tts.stop();
  }
}