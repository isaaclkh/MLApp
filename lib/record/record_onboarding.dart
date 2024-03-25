import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

final List<String> description = [
  "1. Wake up.\nBegin writing in your diary when you wake up each day. Take notes throughout the day, and continue until you complete 24 hours.",
  "2. Note your drinks.\nWrite down what you drink (i.e, water, juice, coffee, wine) and how much in ml(mili litter) or L (litter). It is helpful to measure the amount.",
  "3. Measure urine.\nDuring both the day and night, write down when and how much urine you pass. Doctors often provide a special measuring collection device to use.",
  "4. Three days.\nIt’s best to keep a diary for at least three days. Also, the three days you keep your diary don’t have to be three days in a row. Any three days you chose will be fine.",
  "5. Start tracking.\nGet started by using the attached Bladder Diary to start tracking!",
  "6. SIX",
];

class RecordOnboarding extends StatelessWidget {
  const RecordOnboarding({super.key});
  final Color kDarkBlueColor = const Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
          brightness: Brightness.light,
      ),
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonStyle: FinishButtonStyle(backgroundColor: kDarkBlueColor),
        finishButtonText: "Start",
        totalPage: 5,
        onFinish: (){},
        speed: 1,
        skipTextButton: Text(
          'skip',
          style: TextStyle(
            fontSize: 17,
            color: kDarkBlueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        controllerColor: kDarkBlueColor,
        pageBackgroundColor: Colors.white,
        background: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: SizedBox(

            ),
          ),
        ],
        pageBodies: [],
      ),
    );
  }
}

