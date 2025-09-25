import 'package:flutter/material.dart';
import '../models/worker.dart';

class QRCardWidget extends StatelessWidget {
  final Worker worker;
  const QRCardWidget({required this.worker});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Row(children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
            child: Center(child: Icon(Icons.qr_code, size: 48, color: Colors.grey[700])),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(worker.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('UHID: ${worker.uhid}', style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 6),
              Row(children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text(worker.origin ?? '—', style: TextStyle(fontSize: 13)),
              ]),
            ]),
          ),
          IconButton(
            onPressed: () {
              // TODO: open full QR view
            },
            icon: Icon(Icons.chevron_right),
          ),
        ]),
      ),
    );
  }
}
