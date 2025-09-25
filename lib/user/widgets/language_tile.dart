import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  final String code;
  final String label;
  final VoidCallback onTap;
  const LanguageTile({super.key, required this.code, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(label), onTap: onTap),
    );
  }
}
