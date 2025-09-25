import '../models/notification.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  Future<List<AppNotification>> fetchNotifications(String workerId) async {
    // delegate to firebase service in production
    await Future.delayed(Duration(milliseconds: 250));
    return [
      AppNotification(
        id: 'demo1',
        title: 'Reminder: Clinic visit tomorrow',
        body: 'Visit ABC Clinic tomorrow at 09:00 AM for free checkup.',
      ),
    ];
  }
}
