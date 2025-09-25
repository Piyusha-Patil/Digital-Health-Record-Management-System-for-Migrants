import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import '../models/notification.dart';
import 'notification_detail_screen.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = '/notifications';
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<AppNotification> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await NotificationService.instance.fetchNotifications('worker_demo_1');
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Notifications', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.yellow))
          : ListView.separated(
        padding: EdgeInsets.all(12),
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemCount: _items.length,
        itemBuilder: (_, i) {
          final n = _items[i];
          return ListTile(
            tileColor: Colors.grey[900],
            title: Text(n.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text(n.body, style: TextStyle(color: Colors.grey[300])),
            trailing: Icon(Icons.chevron_right, color: Colors.yellow),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationDetailScreen(notification: n))),
          );
        },
      ),
    );
  }
}
