import 'package:flutter/material.dart';

class ContactSupportScreen extends StatefulWidget {
  static const String routeName = '/contact_support';
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final _msgCtrl = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _msgCtrl.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (_msgCtrl.text.trim().isEmpty) return;
    setState(() => _sending = true);
    await Future.delayed(Duration(milliseconds: 700)); // mock
    setState(() => _sending = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Support request sent')));
    _msgCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Contact Support', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: _msgCtrl,
            maxLines: 6,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(hintText: 'Describe your issue', filled: true, fillColor: Colors.grey[900]),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: _sending ? null : _send,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
            child: _sending ? CircularProgressIndicator(color: Colors.black) : Text('Send'),
          )
        ]),
      ),
    );
  }
}
