import 'package:first/record/onboarding_page_bodies_widget.dart';
import 'package:first/record/urine_collection_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

final List<String> descriptionTitle = [
  "1. Wake up",
  "2. Note your drinks",
  "3. Measure urine",
  "4. Three days",
  "5. Start tracking",
  "6. Remind",
];

final List<String> description = [
  "Begin writing in your diary when you wake up each day. Take notes throughout the day, and continue until you complete 24 hours.",
  "Write down what you drink (i.e, water, juice, coffee, wine) and how much in ml(mili litter) or L (litter). It is helpful to measure the amount.",
  "During both the day and night, write down when and how much urine you pass. Doctors often provide a special measuring collection device to use.",
  "It’s best to keep a diary for at least three days. Also, the three days you keep your diary don’t have to be three days in a row.",
  "Get started by using the attached Bladder Diary to start tracking!",
  "Keep on mind that you to keep recording as accurate as possible for the days you measure.",
];

/// TODO : change to stateful widget
/// SP needs to store the starting date of the collection
/// if collected days are more than 3, then stop collecting
/// INIT STATE has to set the value of provider (urine_collection_provider) to the value of SP
class RecordOnboarding extends StatelessWidget {
  const RecordOnboarding({super.key});
  final Color kDarkBlueColor = const Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Colors.white,
      finishButtonStyle: FinishButtonStyle(backgroundColor: kDarkBlueColor),
      finishButtonText: "Start from TOMORROW",
      totalPage: 6,
      onFinish: (){
        // TODO: set SP value to true + provider = SP value (which is true)
        context.read<UrineCollectionProvider>().collectionStart = true;
        print(context.read<UrineCollectionProvider>().collectionStart);
      },
      speed: 1,
      controllerColor: kDarkBlueColor,
      pageBackgroundColor: Colors.white,
      background: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.43,
          color: Colors.red,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.43,
          color: Colors.orange,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.43,
          color: Colors.yellow,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.43,
          color: Colors.green,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.43,
          color: Colors.blue,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.43,
          color: Colors.purple,
        ),
      ],
      pageBodies: [
        OnBoardingPageBodiesWidget(
            title: descriptionTitle[0],
            description: description[0],
        ),
        OnBoardingPageBodiesWidget(
          title: descriptionTitle[1],
          description: description[1],
        ),
        OnBoardingPageBodiesWidget(
          title: descriptionTitle[2],
          description: description[2],
        ),
        OnBoardingPageBodiesWidget(
          title: descriptionTitle[3],
          description: description[3],
        ),
        OnBoardingPageBodiesWidget(
          title: descriptionTitle[4],
          description: description[4],
        ),
        OnBoardingPageBodiesWidget(
          title: descriptionTitle[5],
          description: description[5],
        ),
      ],
    );
  }
}

