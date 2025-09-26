import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'onboarding_screen.dart';
import '../services/auth_service.dart';
import '../widgets/translator_text.dart'; // added import

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    await Future.delayed(const Duration(milliseconds: 900));
    // Decide route: if logged in -> dashboard, else onboarding
    final auth = AuthService.instance;
    if (auth.isLoggedIn()) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.health_and_safety, size: 74, color: Theme.of(context).primaryColor),
          const SizedBox(height: 16),
          const TranslatorText('DHRMS', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const TranslatorText(
            'Digital Health Record Management System',
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
