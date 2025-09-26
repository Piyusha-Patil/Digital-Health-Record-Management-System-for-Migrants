import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'dashboard_screen.dart';
import '../widgets/translator_text.dart'; // Updated import

class OtpVerificationScreen extends StatefulWidget {
  static const String routeName = '/otp';
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpCtrl = TextEditingController();
  bool _loading = false;
  String? phone;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    phone = args != null ? args['phone'] as String? : null;
  }

  _verify() async {
    if (phone == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: TranslatorText('Missing phone number')),
      );
      return;
    }
    setState(() => _loading = true);
    final ok = await AuthService.instance.verifyOtp(phone!, _otpCtrl.text.trim());
    setState(() => _loading = false);
    if (ok) {
      Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.routeName, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: TranslatorText('Invalid OTP')),
      );
    }
  }

  @override
  void dispose() {
    _otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayPhone = phone ?? '';
    return Scaffold(
      appBar: AppBar(title: TranslatorText('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TranslatorText('We sent an OTP to $displayPhone', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          TextField(
            controller: _otpCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter 6-digit OTP',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loading ? null : _verify,
            child: _loading
                ? const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
            )
                : TranslatorText('Verify'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => AuthService.instance.sendOtp(displayPhone),
            child: TranslatorText('Resend OTP'),
          ),
        ]),
      ),
    );
  }
}
