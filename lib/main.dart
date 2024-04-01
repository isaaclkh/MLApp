import 'package:alarm/alarm.dart';
import 'package:first/catheter/catheter_count_screen.dart';
import 'package:first/catheter/catheter_shared_prefs.dart';
import 'package:first/record/carousel_example.dart';
import 'package:first/record/record_screen.dart';
import 'package:first/record/urine_collection_provider.dart';
import 'package:first/staff/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'graph/graph_widget.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Alarm.init(showDebugLogs: true);
  await CatheterSharedPrefs().init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => UrineCollectionProvider(),
      child: const MaterialApp(
        home: GraphWidget(),
      ),
    ),
  );
}
