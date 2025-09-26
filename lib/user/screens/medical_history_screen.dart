import 'package:flutter/material.dart';
import '../models/medical_record.dart';
import 'visit_detail_screen.dart';
import '../widgets/translator_text.dart'; // Added import

class MedicalHistoryScreen extends StatefulWidget {
  static const String routeName = '/medical_history';
  const MedicalHistoryScreen({super.key});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  // mock data for demo
  late MedicalRecord _record;

  @override
  void initState() {
    super.initState();
    _record = MedicalRecord(
      id: 'mr_demo',
      workerId: 'worker_demo_1',
      visits: [
        Visit(
          id: 'v1',
          date: DateTime.now().subtract(const Duration(days: 20)),
          clinicId: 'clinic_002',
          summary: 'Fever & cough, given symptomatic treatment',
          diagnoses: ['Acute URTI'],
          labs: [
            LabResult(
              id: 'l1',
              name: 'CBC',
              result: 'Normal',
              date: DateTime.now().subtract(const Duration(days: 20)),
            )
          ],
        ),
        Visit(
          id: 'v2',
          date: DateTime.now().subtract(const Duration(days: 90)),
          clinicId: 'clinic_001',
          summary: 'Routine checkup',
          diagnoses: [],
          labs: [],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatorText('Medical History', style: const TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          if (_record.visits.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TranslatorText('No medical history available', style: const TextStyle(color: Colors.white)),
              ),
            ),
          ..._record.visits.map((visit) {
            return Card(
              child: ListTile(
                title: TranslatorText(
                  visit.summary,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${visit.date.toLocal().toString().split(' ').first} • ${visit.clinicId}',
                  style: TextStyle(color: Colors.grey[300]),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.yellow),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VisitDetailScreen(visit: visit)),
                  );
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
