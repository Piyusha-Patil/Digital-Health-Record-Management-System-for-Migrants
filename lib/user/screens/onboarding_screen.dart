import 'package:flutter/material.dart';
import 'language_selection_screen.dart';
import 'tutorial_screen.dart';
import '../widgets/translator_text.dart'; // Updated import

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatorText('Welcome to DHRMS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TranslatorText(
                  'Your health, in your hands',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TranslatorText(
                  'Access your QR health ID, vouchers, appointments and manage consent easily.',
                ),
                const SizedBox(height: 18),
                Image.asset('assets/healthcare.png', height: 160, fit: BoxFit.contain),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, LanguageSelectionScreen.routeName),
            child: TranslatorText('Select Language'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, TutorialScreen.routeName),
            child: TranslatorText('Take a quick tour'),
          ),
        ]),
      ),
    );
  }
}
