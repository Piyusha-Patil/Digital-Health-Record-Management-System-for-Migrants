import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // Added TranslatorText import
import '../services/google_translate_service.dart';

class VoucherDetailScreen extends StatelessWidget {
  final String title;
  final String expiry;
  final String status;
  static const String routeName = '/voucherDetails';
  const VoucherDetailScreen({
    super.key,
    required this.title,
    required this.expiry,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const TranslatorText(
          "Voucher Details",
          style: TextStyle(color: Colors.yellow),
        ),
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TranslatorText(
              title,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.event, color: Colors.yellow),
                const SizedBox(width: 8),
                TranslatorText(
                  "Expiry: $expiry",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.verified, color: Colors.yellow),
                const SizedBox(width: 8),
                TranslatorText(
                  "Status: $status",
                  style: TextStyle(
                    color: status == "Active" ? Colors.green : Colors.red,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: status == "Active"
                  ? () {
                // Handle redeem action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: TranslatorText("Voucher redeemed successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.redeem),
              label: const TranslatorText(
                "Redeem Voucher",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
