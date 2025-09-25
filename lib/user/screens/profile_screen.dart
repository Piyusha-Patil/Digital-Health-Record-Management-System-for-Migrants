import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import '../widgets/profile_card.dart';
import '../services/firebase_service.dart';
import '../models/worker.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Worker? _worker;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final w = await FirebaseService.instance.fetchWorkerById('worker_demo_1');
    setState(() {
      _worker = w;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Profile', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.yellow))
          : ListView(padding: EdgeInsets.all(12), children: [
        ProfileCard(worker: _worker!),
        SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen(worker: _worker!))),
          icon: Icon(Icons.edit),
          label: Text('Edit Profile'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
        ),
        SizedBox(height: 12),
        ListTile(
          tileColor: Colors.grey[900],
          leading: Icon(Icons.phone, color: Colors.yellow),
          title: Text('Linked devices', style: TextStyle(color: Colors.white)),
          subtitle: Text('1 device linked', style: TextStyle(color: Colors.grey[300])),
          onTap: () {},
        ),
      ]),
    );
  }
}
