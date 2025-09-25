import 'package:flutter/material.dart';

class ConsentToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ConsentToggle({super.key, required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(children: [
          Expanded(child: Text(label, style: TextStyle(color: Colors.white))),
          Switch(value: value, activeColor: Colors.yellow, onChanged: onChanged),
        ]),
      ),
    );
  }
}
