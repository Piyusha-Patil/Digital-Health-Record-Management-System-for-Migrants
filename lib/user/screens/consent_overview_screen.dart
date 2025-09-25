import 'package:flutter/material.dart';
import '../services/consent_service.dart';
import '../models/consent.dart';
import 'consent_detail_screen.dart';

class ConsentOverviewScreen extends StatefulWidget {
  static const String routeName = '/consent_overview';
  const ConsentOverviewScreen({super.key});

  @override
  State<ConsentOverviewScreen> createState() => _ConsentOverviewScreenState();
}

class _ConsentOverviewScreenState extends State<ConsentOverviewScreen> {
  List<Consent> _consents = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final list = await ConsentService.instance.getConsentsForWorker('worker_demo_1');
    setState(() {
      _consents = list;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Consent & Privacy', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.yellow))
          : ListView.separated(
        padding: EdgeInsets.all(12),
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemCount: _consents.length,
        itemBuilder: (_, i) {
          final c = _consents[i];
          return ListTile(
            tileColor: Colors.grey[900],
            title: Text(c.scope, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text('Status: ${c.granted ? "Granted" : "Revoked"} • ${c.method ?? "App"}', style: TextStyle(color: Colors.grey[300])),
            trailing: Icon(Icons.chevron_right, color: Colors.yellow),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ConsentDetailScreen(consent: c))),
          );
        },
      ),
    );
  }
}
