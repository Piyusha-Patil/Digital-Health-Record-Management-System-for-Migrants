import 'package:flutter/material.dart';
import '../models/consent.dart';

class ConsentHistoryScreen extends StatelessWidget {
  static const String routeName = '/consent_history';
  final List<Consent> demo = [
    Consent(id: 'c1', scope: 'clinic_access', granted: true, method: 'App', timestamp: DateTime.now().subtract(Duration(days: 30))),
    Consent(id: 'c2', scope: 'employer_access', granted: false, method: 'App', timestamp: DateTime.now().subtract(Duration(days: 5))),
  ];

  ConsentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Consent History', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemCount: demo.length,
        itemBuilder: (_, i) {
          final c = demo[i];
          return Card(
            child: ListTile(
              title: Text(c.scope, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${c.granted ? "Granted" : "Revoked"} via ${c.method} on ${c.timestamp.toLocal().toString().split(" ").first}'),
            ),
          );
        },
      ),
    );
  }
}
