import 'package:flutter/material.dart';
import '../models/notification.dart';
import '../widgets/translator_text.dart'; // Added import

class NotificationDetailScreen extends StatelessWidget {
  final AppNotification notification;
  static const String routeName = '/notificationDetails';
  const NotificationDetailScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: TranslatorText('Notification', style: const TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(notification.title, style: const TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(notification.createdAt.toLocal().toString(), style: TextStyle(color: Colors.grey[400])),
          const SizedBox(height: 12),
          Text(notification.body, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 20),
          if (notification.targetScreen != null)
            ElevatedButton(
              onPressed: () {
                // navigate to deep link target or handle action
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
              child: TranslatorText('Open'),
            )
        ]),
      ),
    );
  }
}
