import 'package:flutter/material.dart';
import '../models/worker.dart';
import '../widgets/translator_text.dart'; // Import the translator widget

class EditProfileScreen extends StatefulWidget {
  final Worker worker;
  static const String routeName = '/editProfile';
  const EditProfileScreen({super.key, required this.worker});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _ageCtrl;
  late TextEditingController _originCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.worker.name);
    _ageCtrl = TextEditingController(text: widget.worker.age?.toString() ?? '');
    _originCtrl = TextEditingController(text: widget.worker.origin ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ageCtrl.dispose();
    _originCtrl.dispose();
    super.dispose();
  }

  void _save() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TranslatorText('Profile updated')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: TranslatorText('Edit Profile', style: TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.yellow),
                enabledBorder: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _ageCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                enabledBorder: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _originCtrl,
              decoration: InputDecoration(
                labelText: 'Origin',
                enabledBorder: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, foregroundColor: Colors.black),
              child: TranslatorText('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
