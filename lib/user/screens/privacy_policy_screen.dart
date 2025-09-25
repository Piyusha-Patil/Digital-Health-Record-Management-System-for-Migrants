import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String routeName = '/privacyPolicy';
  static const NAVY = Color(0xFF0A2540);

  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final policies = [
      "We collect only necessary information to provide healthcare services.",
      "Your data will never be sold or misused.",
      "You can revoke consent for data sharing anytime.",
      "Our system follows standard encryption and security protocols.",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const Text("Privacy Policy"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: policies.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.privacy_tip, color: NAVY),
            title: Text(policies[index]),
          ),
        ),
      ),
    );
  }
}
