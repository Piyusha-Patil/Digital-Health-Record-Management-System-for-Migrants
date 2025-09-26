import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import '../widgets/profile_card.dart';
import '../services/firebase_service.dart';
import '../models/worker.dart';
import '../widgets/translator_text.dart'; // added import

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
      appBar: AppBar(
        title: const TranslatorText('Profile'),
        backgroundColor: Colors.black,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: Colors.yellow))
          : ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ProfileCard(worker: _worker!),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EditProfileScreen(worker: _worker!)),
            ),
            icon: const Icon(Icons.edit),
            label: const TranslatorText('Edit Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            tileColor: Colors.grey[900],
            leading: const Icon(Icons.phone, color: Colors.yellow),
            title: const TranslatorText('Linked devices'),
            subtitle: const TranslatorText('1 device linked'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
