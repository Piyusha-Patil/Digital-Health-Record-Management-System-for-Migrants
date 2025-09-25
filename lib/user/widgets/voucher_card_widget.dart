import 'package:flutter/material.dart';

class VoucherCardWidget extends StatelessWidget {
  final String title;
  final String expiry;
  final String status;
  final VoidCallback? onTap;

  const VoucherCardWidget({super.key, required this.title, required this.expiry, required this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    final active = status.toLowerCase() == 'active' || status.toLowerCase() == 'unused';
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        onTap: onTap,
        title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text('Valid until: $expiry', style: TextStyle(color: Colors.grey[300])),
        trailing: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(color: active ? Colors.green : Colors.grey, borderRadius: BorderRadius.circular(8)),
          child: Text(status, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
