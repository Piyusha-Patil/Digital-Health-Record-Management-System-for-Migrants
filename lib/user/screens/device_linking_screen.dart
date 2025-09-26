import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // Import the translator widget

class DeviceLinkingScreen extends StatelessWidget {
  static const String routeName = '/device_linking';
  const DeviceLinkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: TranslatorText(
          'Linked Devices',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                title: TranslatorText('My Phone'),
                subtitle: TranslatorText('Last seen: Today'),
                trailing: TranslatorText('Active'),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, foregroundColor: Colors.black),
              child: TranslatorText('Link another device'),
            ),
          ],
        ),
      ),
    );
  }
}
