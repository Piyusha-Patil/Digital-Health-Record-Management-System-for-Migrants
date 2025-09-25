import 'package:flutter/material.dart';
import '../models/medical_record.dart';

class LabResultDetailScreen extends StatelessWidget {
  final LabResult lab;
  static const String routeName = '/labResultDetails';
  const LabResultDetailScreen({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Result', style: TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(lab.name, style: TextStyle(color: Colors.yellow, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('Date: ${lab.date.toLocal().toString().split(" ").first}', style: TextStyle(color: Colors.white)),
          SizedBox(height: 12),
          Text('Result:', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(lab.result, style: TextStyle(color: Colors.white)),
          SizedBox(height: 18),
          ElevatedButton.icon(
            onPressed: () {
              // placeholder for share/download
            },
            icon: Icon(Icons.download),
            label: Text('Download PDF'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
          )
        ]),
      ),
    );
  }
}
