import 'dart:async';

class AuthService {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  String? _phoneForOtp;
  String? currentWorkerId; // set after successful login/verification

  // Mock: send OTP - in real app, call Firebase/OTP API
  Future<bool> sendOtp(String phone) async {
    _phoneForOtp = phone;
    // simulate network
    await Future.delayed(Duration(milliseconds: 800));
    // In production: call Firebase Auth to send OTP
    return true;
  }

  // Mock: verify OTP - in real app, verify with provider and get token
  Future<bool> verifyOtp(String phone, String code) async {
    await Future.delayed(Duration(milliseconds: 800));
    // naive check for demo:
    if (_phoneForOtp == phone && (code == '123456' || code.length == 6)) {
      // on success, set a demo worker id
      currentWorkerId = 'worker_demo_1';
      return true;
    }
    return false;
  }

  bool isLoggedIn() => currentWorkerId != null;

  Future<void> logout() async {
    currentWorkerId = null;
    await Future.delayed(Duration(milliseconds: 200));
  }
}
