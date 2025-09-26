import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // added import
import '../services/google_translate_service.dart';

class VaccinationRecordScreen extends StatelessWidget {
  static const String routeName = '/vaccinationRecord';
  static const NAVY = Color(0xFF0A2540);

  const VaccinationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final records = [
      {"vaccine": "COVID-19 (Dose 1)", "date": "2024-01-15", "status": "Completed"},
      {"vaccine": "COVID-19 (Dose 2)", "date": "2024-03-20", "status": "Completed"},
      {"vaccine": "Tetanus", "date": "2025-02-10", "status": "Upcoming"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const TranslatorText("Vaccination Records"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: records.length,
        itemBuilder: (context, index) {
          final r = records[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.vaccines, color: NAVY),
              title: TranslatorText(r["vaccine"]!),
              subtitle: TranslatorText("Date: ${r["date"]}"),
              trailing: TranslatorText(
                r["status"]!,
                style: TextStyle(
                  color: r["status"] == "Completed" ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
