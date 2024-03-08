import 'package:first/account_setting/account_settings_tile.dart';
import 'package:first/account_setting/settings_tile.dart';
import 'package:flutter/material.dart';

import '../home_ui.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 225, 225, 0.3),
      appBar: AppBar(
        title: const Text("Account Settings"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          const Icon(Icons.account_circle_rounded, size: 100,),
          const Text("Isaac", style: TextStyle(color: Colors.white, fontSize: 30,),),
          const SizedBox(height: 30,),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color.fromRGBO(225, 225, 225, 1),),
                bottom: BorderSide(color: Color.fromRGBO(225, 225, 225, 1),),
              ),
            ),
            child: SettingsTile(stIcon: Icons.info, title: "Patch info", goto: const HomeUI(), bgColor: Colors.blueAccent,),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color.fromRGBO(225, 225, 225, 1),),
                bottom: BorderSide(color: Color.fromRGBO(225, 225, 225, 1),),
              ),
            ),
            child: AccountSettingsTile(stIcon: Icons.info, title: "Patch info", bgColor: Colors.blueAccent, info: "Isaac",),
          ),
        ],
      ),
    );
  }
}
