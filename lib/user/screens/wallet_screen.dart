import 'package:flutter/material.dart';
import '../widgets/translator_text.dart';
import '../services/google_translate_service.dart';

class WalletScreen extends StatelessWidget {
  static const String routeName = '/wallet';
  static const NAVY = Color(0xFF0A2540);

  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = 120.0;
    final transactions = [
      {"title": "Voucher Redeemed", "amount": "-₹50", "date": "2025-06-12"},
      {"title": "Wallet Top-up", "amount": "+₹200", "date": "2025-06-05"},
      {"title": "Medicine Purchase", "amount": "-₹30", "date": "2025-05-28"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const TranslatorText("My Wallet"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: NAVY,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: [
            const TranslatorText("Wallet Balance", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            Text("₹$balance", style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final t = transactions[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: NAVY),
                  title: TranslatorText(t["title"]!),
                  subtitle: TranslatorText(t["date"]!),
                  trailing: Text(
                    t["amount"]!,
                    style: TextStyle(
                      color: t["amount"]!.contains("+") ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
