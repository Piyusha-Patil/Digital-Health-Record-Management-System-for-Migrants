import 'package:translator/translator.dart';

class GoogleTranslateService {
  final GoogleTranslator _translator = GoogleTranslator();

  /// Translate text to target language
  Future<String> translate(String text, String targetLang) async {
    try {
      var translation = await _translator.translate(
        text,
        from: 'auto',   // detect automatically
        to: targetLang, // target language
      );
      return translation.text;
    } catch (e) {
      print("Translation error: $e");
      return "Error translating";
    }
  }
}
