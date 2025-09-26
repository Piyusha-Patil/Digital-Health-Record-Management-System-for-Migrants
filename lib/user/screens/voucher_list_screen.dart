import 'package:flutter/material.dart';
import 'voucher_detail_screen.dart';
import '../widgets/voucher_card_widget.dart';
import '../widgets/translator_text.dart'; // Added TranslatorText import
import '../services/google_translate_service.dart';

class VoucherListScreen extends StatelessWidget {
  static const String routeName = '/vouchers';
  const VoucherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary mock data
    final vouchers = [
      {"title": "Health Check Voucher", "expiry": "2025-12-01", "status": "Active"},
      {"title": "Medicine Discount", "expiry": "2025-10-15", "status": "Used"},
      {"title": "Free Lab Test", "expiry": "2026-01-20", "status": "Active"},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const TranslatorText(
          "My Vouchers",
          style: TextStyle(color: Colors.yellow),
        ),
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      body: ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          final voucher = vouchers[index];
          return VoucherCardWidget(
            title: voucher["title"]!,
            expiry: voucher["expiry"]!,
            status: voucher["status"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VoucherDetailScreen(
                    title: voucher["title"]!,
                    expiry: voucher["expiry"]!,
                    status: voucher["status"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
