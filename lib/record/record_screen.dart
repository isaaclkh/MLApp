import 'package:first/record/record_onboarding.dart';
import 'package:first/record/urine_collection_list_widget.dart';
import 'package:first/record/urine_collection_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}



class _RecordScreenState extends State<RecordScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Urine Collection"),
        centerTitle: true,
      ),

      body: Consumer<UrineCollectionProvider>(
        builder: (_, snapshot, child) {
          return snapshot.collectionStart?
          const UrineCollectionListWidget():
          const RecordOnboarding();
        },
      ),
    );
  }
}

