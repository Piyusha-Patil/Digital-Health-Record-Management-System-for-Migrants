import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneCtrl = TextEditingController();
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;
    final phone = _phoneCtrl.text.trim();
    setState(() => _loading = true);
    final ok = await AuthService.instance.sendOtp(phone);
    setState(() => _loading = false);
    if (ok) {
      Navigator.pushNamed(context, OtpVerificationScreen.routeName, arguments: {'phone': phone});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unable to send OTP. Try later.')));
    }
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in / Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text('Enter mobile number', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            TextFormField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(prefixText: '+91 ', hintText: '9999999999'),
              validator: (v) {
                if (v == null || v.trim().length < 6) return 'Enter valid phone';
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _sendOtp,
              child: _loading ? CircularProgressIndicator(color: Colors.white) : Text('Send OTP'),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'), // placeholder
              child: Text('Scan QR card instead'),
            )
          ]),
        ),
      ),
    );
  }
}
