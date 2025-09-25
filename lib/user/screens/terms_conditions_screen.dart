import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  static const String routeName = '/termsConditions';
  static const NAVY = Color(0xFF0A2540);

  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final terms = [
      "You must provide accurate health details.",
      "This service is not a substitute for emergency care.",
      "You agree to our data usage & privacy terms.",
      "We may update these terms periodically.",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const Text("Terms & Conditions"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: terms.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline, color: NAVY),
            title: Text(terms[index]),
          ),
        ),
      ),
    );
  }
}
