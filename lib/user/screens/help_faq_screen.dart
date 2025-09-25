import 'package:flutter/material.dart';

class HelpFaqScreen extends StatelessWidget {
  static const String routeName = '/help_faq';
  const HelpFaqScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {'q': 'How do I use my voucher?', 'a': 'Open voucher, show QR at the clinic to redeem.'},
    {'q': 'What if I lose my QR card?', 'a': 'Use the app QR or request re-issue from frontline team.'},
    {'q': 'How to revoke consent?', 'a': 'Open Consent screen and toggle off the relevant scope.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Help & FAQ', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: faqs.length,
        itemBuilder: (_, i) {
          final f = faqs[i];
          return Card(
            child: ListTile(
              title: Text(f['q']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(f['a']!),
            ),
          );
        },
      ),
    );
  }
}
