import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // added import

class QrScanScreen extends StatelessWidget {
  static const String routeName = '/qrScan';
  static const NAVY = Color(0xFF0A2540);

  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const TranslatorText("Scan QR"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: NAVY, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.qr_code_scanner, size: 180, color: NAVY),
            ),
          ),
          const SizedBox(height: 16),
          const TranslatorText("Align QR code within the frame", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: TranslatorText("Scanned Successfully (mock)")),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: NAVY),
            icon: const Icon(Icons.check),
            label: const TranslatorText("Simulate Scan"),
          ),
        ]),
      ),
    );
  }
}
