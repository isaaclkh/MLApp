import 'package:alarm/alarm.dart';
import 'package:first/before/aiScreen.dart';
import 'package:first/chat/temp.dart';
import 'package:first/home_ui.dart';
import 'package:first/reference16.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alarm_test_dir/alarm_test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Alarm.init(showDebugLogs: true);

  runApp(
    const MaterialApp(
      home: AIScreen(),
    )
  );
}
