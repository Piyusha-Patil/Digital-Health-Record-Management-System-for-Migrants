import 'package:flutter/material.dart';
import '../widgets/language_tile.dart';
import 'login_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  static const String routeName = '/language';
  final List<Map<String, String>> languages = [
    {'code': 'en', 'label': 'English'},
    {'code': 'hi', 'label': 'हिन्दी'},
    {'code': 'bn', 'label': 'বাংলা'},
    {'code': 'mr', 'label': 'मराठी'},
    // add more as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (_, i) {
          final lang = languages[i];
          return LanguageTile(
            code: lang['code']!,
            label: lang['label']!,
            onTap: () {
              // Save preferred language locally - placeholder
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          );
        },
      ),
    );
  }
}
