import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationDetailScreen extends StatelessWidget {
  final AppNotification notification;
  static const String routeName = '/notificationDetails';
  const NotificationDetailScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Notification', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(notification.title, style: TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(notification.createdAt.toLocal().toString(), style: TextStyle(color: Colors.grey[400])),
          SizedBox(height: 12),
          Text(notification.body, style: TextStyle(color: Colors.white)),
          SizedBox(height: 20),
          if (notification.targetScreen != null)
            ElevatedButton(
              onPressed: () {
                // navigate to deep link target or handle action
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
              child: Text('Open'),
            )
        ]),
      ),
    );
  }
}
