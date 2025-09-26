import 'package:flutter/material.dart';
import '../core/language_manager.dart';
import '../services/google_translate_service.dart';

class TranslationHelper {
  static final GoogleTranslateService _translator = GoogleTranslateService();

  /// Returns translated text based on selected language
  static Future<String> t(String text) async {
    String langCode = LanguageManager().currentLanguageCode;
    if (langCode == 'en') return text; // Skip if English
    return await _translator.translate(text, langCode);
  }
}
