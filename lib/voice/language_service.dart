import 'package:flutter/foundation.dart';

class LanguageService extends ChangeNotifier {
  static final LanguageService instance = LanguageService._internal();

  LanguageService._internal();

  String _language = 'en';

  String get language => _language;

  bool get isHindi => _language == 'hi';

  bool get isEnglish => _language == 'en';

  String get speechLanguage => isHindi ? 'hi-IN' : 'en-IN';

  void setLanguage(String language) {
    if (language != 'en' && language != 'hi') {
      return;
    }

    _language = language;
    notifyListeners();
  }

  void toggleLanguage() {
    _language = isEnglish ? 'hi' : 'en';
    notifyListeners();
  }
}