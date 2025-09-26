import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firebase_service.dart';
import '../models/worker.dart';
import '../models/voucher.dart';
import '../models/notification.dart';
import '../widgets/qr_card_widget.dart';
import '../widgets/translator_text.dart';
import '../utils/translation_helper.dart';

// Existing imports
import 'medical_history_screen.dart';
import 'voucher_list_screen.dart';
import 'notifications_screen.dart';
import 'consent_overview_screen.dart';
import 'profile_screen.dart';

// Newly added screens
import 'feedback_screen.dart';
import 'prescriptions_screen.dart';
import 'wallet_screen.dart';
import 'qr_display_screen.dart';
import 'qr_scan_screen.dart';
import 'vaccination_record_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Worker? _worker;
  List<Voucher>? _vouchers;
  List<AppNotification>? _notifications;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    setState(() => _loading = true);
    final uid = AuthService.instance.currentWorkerId ?? 'worker_demo_1';
    final worker = await FirebaseService.instance.fetchWorkerById(uid);
    final vouchers = await FirebaseService.instance.fetchVouchersForWorker(uid);
    final notifs =
    await FirebaseService.instance.fetchNotificationsForWorker(uid);
    setState(() {
      _worker = worker;
      _vouchers = vouchers;
      _notifications = notifs;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: TranslatorText('Dashboard')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TranslatorText('My Health'),
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
            icon: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _bootstrap,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Worker QR card
              QRCardWidget(worker: _worker!),
              SizedBox(height: 16),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, QrDisplayScreen.routeName),
                child: Card(
                  color: Colors.blue.shade800,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code, color: Colors.yellow, size: 40),
                        SizedBox(width: 12),
                        TranslatorText(
                          'Show My QR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white70),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // 🔹 Quick actions grid
              TranslatorText(
                'Quick Actions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _quickAction(
                    icon: Icons.card_giftcard,
                    label: 'Vouchers',
                    onTap: () =>
                        Navigator.pushNamed(context, VoucherListScreen.routeName),
                  ),
                  _quickAction(
                    icon: Icons.history,
                    label: 'Medical History',
                    onTap: () =>
                        Navigator.pushNamed(context, MedicalHistoryScreen.routeName),
                  ),
                  _quickAction(
                    icon: Icons.lock,
                    label: 'Consent',
                    onTap: () =>
                        Navigator.pushNamed(context, ConsentOverviewScreen.routeName),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // 🔹 Active vouchers card
              _sectionCard(
                title: 'Active Vouchers',
                child: _vouchers == null || _vouchers!.isEmpty
                    ? TranslatorText('No active vouchers',
                    style: TextStyle(color: Colors.white70))
                    : Column(
                  children: _vouchers!
                      .map((v) => ListTile(
                    title: TranslatorText(
                        '${v.type} • ${v.code}',
                        style: TextStyle(color: Colors.white)),
                    subtitle: TranslatorText(
                      'Valid until: ${v.validTo.toLocal().toString().split(" ").first}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: TranslatorText(
                      v.redeemed ? 'Redeemed' : 'Active',
                      style: TextStyle(
                          color: v.redeemed ? Colors.grey : Colors.yellow),
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, VoucherListScreen.routeName),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(height: 20),

              // 🔹 Notifications card
              _sectionCard(
                title: 'Notifications',
                child: _notifications == null || _notifications!.isEmpty
                    ? TranslatorText('No notifications',
                    style: TextStyle(color: Colors.white70))
                    : Column(
                  children: _notifications!
                      .map((n) => ListTile(
                    title: TranslatorText(n.title,
                        style: TextStyle(color: Colors.white)),
                    subtitle: TranslatorText(n.body,
                        style: TextStyle(color: Colors.white70)),
                    onTap: () => Navigator.pushNamed(
                        context, NotificationsScreen.routeName),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(height: 20),

              // 🔹 More Services expandable
              _sectionCard(
                title: 'More Services',
                child: Column(
                  children: [
                    _serviceButton(
                        context, Icons.medical_services, 'My Prescriptions',
                        PrescriptionsScreen.routeName),
                    _serviceButton(
                        context, Icons.vaccines, 'Vaccination Records',
                        VaccinationRecordScreen.routeName),
                    _serviceButton(
                        context, Icons.account_balance_wallet, 'My Wallet',
                        WalletScreen.routeName),
                    _serviceButton(
                        context, Icons.feedback, 'Give Feedback',
                        FeedbackScreen.routeName),
                    _serviceButton(
                        context, Icons.qr_code, 'Show My QR',
                        QrDisplayScreen.routeName),
                    _serviceButton(
                        context, Icons.qr_code_scanner, 'Scan QR',
                        QrScanScreen.routeName),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Quick action grid item
  Widget _quickAction(
      {required IconData icon,
        required String label,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.blue.shade800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32, color: Colors.yellow),
              SizedBox(height: 8),
              TranslatorText(label,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Section card wrapper
  Widget _sectionCard({required String title, required Widget child}) {
    return Card(
      color: Colors.blue.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TranslatorText(title,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }

  // 🔹 Service button inside More Services
  Widget _serviceButton(
      BuildContext context, IconData icon, String label, String routeName) {
    return ListTile(
      leading: Icon(icon, color: Colors.yellow),
      title: TranslatorText(label, style: TextStyle(color: Colors.white)),
      onTap: () => Navigator.pushNamed(context, routeName),
    );
  }
}
