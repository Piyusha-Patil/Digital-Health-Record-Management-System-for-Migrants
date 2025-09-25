import 'package:flutter/material.dart';

class VoucherRedemptionHistoryScreen extends StatelessWidget {
  static const String routeName = '/voucherRedemptionHistory';
  static const NAVY = Color(0xFF0A2540);

  const VoucherRedemptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      {"voucher": "Health Check Voucher", "date": "2025-06-10", "status": "Redeemed"},
      {"voucher": "Medicine Discount", "date": "2025-07-02", "status": "Expired"},
      {"voucher": "Free Lab Test", "date": "2025-09-01", "status": "Redeemed"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const Text("Voucher History"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final h = history[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.redeem, color: NAVY),
              title: Text(h["voucher"]!),
              subtitle: Text("Date: ${h["date"]}"),
              trailing: Text(
                h["status"]!,
                style: TextStyle(
                  color: h["status"] == "Redeemed" ? Colors.green : Colors.red,
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
