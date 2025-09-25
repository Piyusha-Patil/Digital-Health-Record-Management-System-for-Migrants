import 'package:flutter/material.dart';
import '../models/worker.dart';

class ProfileCard extends StatelessWidget {
  final Worker worker;
  const ProfileCard({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Row(children: [
          CircleAvatar(radius: 32, backgroundColor: Colors.grey[700], child: Icon(Icons.person, color: Colors.white)),
          SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(worker.name, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('UHID: ${worker.uhid}', style: TextStyle(color: Colors.grey[300])),
              SizedBox(height: 4),
              Text(worker.phone, style: TextStyle(color: Colors.grey[300])),
            ]),
          ),
        ]),
      ),
    );
  }
}
