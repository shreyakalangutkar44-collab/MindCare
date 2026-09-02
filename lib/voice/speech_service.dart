import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  bool isAvailable = false;

  Future<bool> initialize() async {
    isAvailable = await _speech.initialize();
    return isAvailable;
  }

  Future<void> startListening({
    required Function(String text) onResult,
    String language = 'en-IN',
  }) async {
    if (!isAvailable) {
      await initialize();
    }

    if (!isAvailable) {
      return;
    }

    await _speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
      listenOptions: SpeechListenOptions(
        localeId: language,
        partialResults: true,
      ),
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }

  bool get isListening => _speech.isListening;
}