import 'package:flutter/material.dart';
import 'language_selection_screen.dart';
import 'device_linking_screen.dart';
import 'biometric_link_request_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Settings', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: ListView(padding: EdgeInsets.all(12), children: [
        Card(child: ListTile(leading: Icon(Icons.language, color: Colors.yellow), title: Text('Language'), onTap: () => Navigator.pushNamed(context, LanguageSelectionScreen.routeName))),
        Card(child: ListTile(leading: Icon(Icons.devices, color: Colors.yellow), title: Text('Linked Devices'), onTap: () => Navigator.pushNamed(context, DeviceLinkingScreen.routeName))),
        Card(child: ListTile(leading: Icon(Icons.fingerprint, color: Colors.yellow), title: Text('Link Biometric'), onTap: () => Navigator.pushNamed(context, BiometricLinkRequestScreen.routeName))),
        Card(child: ListTile(leading: Icon(Icons.help, color: Colors.yellow), title: Text('Help & FAQ'), onTap: () => Navigator.pushNamed(context, '/help_faq'))),
        Card(child: ListTile(leading: Icon(Icons.contact_support, color: Colors.yellow), title: Text('Contact Support'), onTap: () => Navigator.pushNamed(context, '/contact_support'))),
      ]),
    );
  }
}
