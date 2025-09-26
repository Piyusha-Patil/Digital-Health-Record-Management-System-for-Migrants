import 'package:flutter/material.dart';
import '../models/medical_record.dart';
import '../services/google_translate_service.dart';
import '../widgets/translator_text.dart';

class LabResultDetailScreen extends StatelessWidget {
  final LabResult lab;
  static const String routeName = '/labResultDetails';
  const LabResultDetailScreen({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatorText('Lab Result', style: const TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(lab.name, style: const TextStyle(color: Colors.yellow, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TranslatorText('Date: ${lab.date.toLocal().toString().split(" ").first}', style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 12),
          TranslatorText('Result:', style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(lab.result, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 18),
          ElevatedButton.icon(
            onPressed: () {
              // placeholder for share/download
            },
            icon: const Icon(Icons.download),
            label: TranslatorText('Download PDF'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
          )
        ]),
      ),
    );
  }
}
