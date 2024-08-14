import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: const Text('Settings',
            style: TextStyle(fontSize: 30, letterSpacing: 10)),
      ),
    );
  }
}
