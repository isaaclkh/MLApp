import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Screen"),
      ),
      body: const Center(
        child: Text("Staff screen"),
      ),
    );
  }
}
