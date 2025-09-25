import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationTile extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback? onTap;

  const NotificationTile({super.key, required this.notification, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        onTap: onTap,
        title: Text(notification.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(notification.body, style: TextStyle(color: Colors.grey[300])),
        trailing: Text(notification.createdAt.toLocal().toString().split(' ').first, style: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
