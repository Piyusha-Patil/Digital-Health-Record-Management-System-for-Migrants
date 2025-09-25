import 'package:flutter/material.dart';
import 'language_selection_screen.dart';
import 'tutorial_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to DHRMS'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your health, in your hands', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('Access your QR health ID, vouchers, appointments and manage consent easily.'),
                SizedBox(height: 18),
                Image.asset('assets/healthcare.png', height: 160, fit: BoxFit.contain),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, LanguageSelectionScreen.routeName),
            child: Text('Select Language'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, TutorialScreen.routeName),
            child: Text('Take a quick tour'),
          ),
        ]),
      ),
    );
  }
}
