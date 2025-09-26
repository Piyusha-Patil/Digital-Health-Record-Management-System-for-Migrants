import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import '../models/notification.dart';
import 'notification_detail_screen.dart';
import '../widgets/translator_text.dart'; // Updated import

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
      appBar: AppBar(
        title: TranslatorText('Notifications', style: const TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: Colors.yellow))
          : ListView.separated(
        padding: const EdgeInsets.all(12),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: _items.length,
        itemBuilder: (_, i) {
          final n = _items[i];
          return ListTile(
            tileColor: Colors.grey[900],
            title: TranslatorText(n.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: TranslatorText(n.body, style: const TextStyle(color: Colors.grey)),
            trailing: const Icon(Icons.chevron_right, color: Colors.yellow),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NotificationDetailScreen(notification: n)),
            ),
          );
        },
      ),
    );
  }
}
