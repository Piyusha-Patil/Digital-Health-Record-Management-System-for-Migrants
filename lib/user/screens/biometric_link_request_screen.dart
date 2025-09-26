import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // make sure path matches your project
import '../utils/translation_helper.dart'; // optional, if using helper for dynamic text

class BiometricLinkRequestScreen extends StatelessWidget {
  static const String routeName = '/biometric_link';
  const BiometricLinkRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const TranslatorText(
          'Link Biometric',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Static description text
            const TranslatorText(
              'To add biometric authentication (fingerprint / iris), visit an enrollment point or request linking.',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),

            // Button with dynamic SnackBar translation
            ElevatedButton(
              onPressed: () async {
                // Use TranslationHelper for dynamic message
                String translatedMsg = await TranslationHelper.t('Link request sent');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(translatedMsg)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const TranslatorText('Request Link'),
            ),
          ],
        ),
      ),
    );
  }
}

