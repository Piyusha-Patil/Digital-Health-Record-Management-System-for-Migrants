import 'package:flutter/material.dart';
import '../models/medical_record.dart';
import 'lab_result_detail_screen.dart';

class VisitDetailScreen extends StatelessWidget {
  final Visit visit;
  static const String routeName = '/visitDetails';
  const VisitDetailScreen({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visit Details', style: TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Date: ${visit.date.toLocal().toString().split(" ").first}', style: TextStyle(color: Colors.white)),
          SizedBox(height: 8),
          Text('Clinic: ${visit.clinicId}', style: TextStyle(color: Colors.white)),
          SizedBox(height: 12),
          Text('Summary:', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(visit.summary, style: TextStyle(color: Colors.white)),
          SizedBox(height: 12),
          Text('Diagnoses:', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          if (visit.diagnoses.isEmpty) Text('—', style: TextStyle(color: Colors.white)) else ...visit.diagnoses.map((d) => Text('- $d', style: TextStyle(color: Colors.white))),
          SizedBox(height: 12),
          Text('Lab Results:', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          if (visit.labs.isEmpty)
            Text('No lab results recorded', style: TextStyle(color: Colors.white))
          else
            ...visit.labs.map((lab) => Card(
              child: ListTile(
                title: Text(lab.name),
                subtitle: Text('Result: ${lab.result} • ${lab.date.toLocal().toString().split(" ").first}'),
                trailing: Icon(Icons.chevron_right, color: Colors.yellow),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LabResultDetailScreen(lab: lab))),
              ),
            )),
        ]),
      ),
    );
  }
}
