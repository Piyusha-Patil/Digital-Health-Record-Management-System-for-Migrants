import 'package:flutter/material.dart';

class BiometricLinkRequestScreen extends StatelessWidget {
  static const String routeName = '/biometric_link';
  const BiometricLinkRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Link Biometric', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('To add biometric authentication (fingerprint / iris), visit an enrollment point or request linking.', style: TextStyle(color: Colors.white)),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // request linking workflow placeholder
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Link request sent')));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
            child: Text('Request Link'),
          ),
        ]),
      ),
    );
  }
}
