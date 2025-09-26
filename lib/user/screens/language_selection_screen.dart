import 'package:flutter/material.dart';
import '../widgets/language_tile.dart';
import '../core/language_manager.dart';
import 'login_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  static const String routeName = '/language';

  final List<Map<String, String>> languages = [
    {'code': 'en', 'label': 'English'},
    {'code': 'hi', 'label': 'हिन्दी'},
    {'code': 'ml', 'label': 'മലയാളം'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (_, i) {
          final lang = languages[i];
          return LanguageTile(
            code: lang['code']!,
            label: lang['label']!,
            onTap: () {
              // Save the selected language globally
              LanguageManager().currentLanguageCode = lang['code']!;

              // Navigate to LoginScreen (or Dashboard)
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          );
        },
      ),
    );
  }
}

