import 'package:first/staff/passkey_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: FilledButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PasskeyScreen()));
          },
          child: const Text("Staff Mode"),
        ),
      ),
    );
  }
}
