import 'package:flutter/material.dart';
import '../models/consent.dart';
import '../services/consent_service.dart';
import '../widgets/translator_text.dart'; // Add this import
import '../utils/translation_helper.dart'; // Optional, if you need helper

class ConsentDetailScreen extends StatefulWidget {
  final Consent consent;
  static const String routeName = '/consentDetails';
  const ConsentDetailScreen({super.key, required this.consent});

  @override
  State<ConsentDetailScreen> createState() => _ConsentDetailScreenState();
}

class _ConsentDetailScreenState extends State<ConsentDetailScreen> {
  late bool _granted;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _granted = widget.consent.granted;
  }

  Future<void> _toggle(bool v) async {
    setState(() => _saving = true);
    await ConsentService.instance
        .setConsent('worker_demo_1', widget.consent.scope, v, 'App');
    setState(() {
      _granted = v;
      _saving = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TranslatorText(
          v ? 'Consent granted' : 'Consent revoked',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: TranslatorText(widget.consent.scope,
            style: TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TranslatorText(
              'Method: ${widget.consent.method ?? "App"}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            TranslatorText(
              'Last updated: ${widget.consent.timestamp.toLocal().toString()}',
              style: TextStyle(color: Colors.grey[300]),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                TranslatorText(
                  'Allow sharing for this scope?',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                _saving
                    ? CircularProgressIndicator(color: Colors.yellow)
                    : Switch(
                  value: _granted,
                  activeColor: Colors.yellow,
                  onChanged: _toggle,
                )
              ],
            ),
            SizedBox(height: 20),
            TranslatorText(
              'Audit log and more controls will be visible here.',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
