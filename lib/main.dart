import 'package:alarm/alarm.dart';
import 'package:first/catheter/catheter_count_screen.dart';
import 'package:first/catheter/catheter_shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Alarm.init(showDebugLogs: true);
  await CatheterSharedPrefs().init();

  runApp(
    const MaterialApp(
      home: CatheterCountScreen(),
    )
  );
}
