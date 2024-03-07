import 'package:alarm/alarm.dart';
import 'package:first/account_setting/account_setting_screen.dart';
import 'package:first/aiScreen.dart';
import 'package:first/catheter/catheter_count_screen.dart';
import 'package:first/catheter/catheter_shared_prefs.dart';
import 'package:first/chat/temp.dart';
import 'package:first/home_ui.dart';
import 'package:first/reference16.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alarm_test_dir/alarm_test.dart';
import 'catheter/board_datetime_picker_ex.dart';

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
