import 'package:flutter/material.dart';

class QrDisplayScreen extends StatelessWidget {
  static const String routeName = '/qrDisplay';
  static const NAVY = Color(0xFF0A2540);

  final String uhid;
  const QrDisplayScreen({super.key, this.uhid = "UHID-123456"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const Text("My QR Code"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(color: NAVY, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.qr_code, size: 180, color: NAVY),
            ),
          ),
          const SizedBox(height: 16),
          Text("UHID: $uhid", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("QR Downloaded (mock)"))),
            style: ElevatedButton.styleFrom(backgroundColor: NAVY),
            icon: const Icon(Icons.download),
            label: const Text("Download QR"),
          ),
        ]),
      ),
    );
  }
}
