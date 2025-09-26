// lib/core/language_manager.dart
class LanguageManager {
  static final LanguageManager _instance = LanguageManager._internal();

  factory LanguageManager() => _instance;

  LanguageManager._internal();

  // Default language
  String currentLanguageCode = 'en';
}
