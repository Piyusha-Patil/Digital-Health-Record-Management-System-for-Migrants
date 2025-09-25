import 'package:flutter/material.dart';

class DeviceLinkingScreen extends StatelessWidget {
  static const String routeName = '/device_linking';
  const DeviceLinkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Linked Devices', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Card(child: ListTile(title: Text('My Phone'), subtitle: Text('Last seen: Today'), trailing: Text('Active'))),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
            child: Text('Link another device'),
          ),
        ]),
      ),
    );
  }
}
