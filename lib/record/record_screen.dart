import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';


final List<String> description = [
  "1. Wake up.\nBegin writing in your diary when you wake up each day. Take notes throughout the day, and continue until you complete 24 hours.",
  "2. Note your drinks.\nWrite down what you drink (i.e, water, juice, coffee, wine) and how much in ml(mili litter) or L (litter). It is helpful to measure the amount.",
  "3. Measure urine.\nDuring both the day and night, write down when and how much urine you pass. Doctors often provide a special measuring collection device to use.",
  "4. Three days.\nIt’s best to keep a diary for at least three days. Also, the three days you keep your diary don’t have to be three days in a row. Any three days you chose will be fine.",
  "5. Start tracking.\nGet started by using the attached Bladder Diary to start tracking!",
  "6. SIX",
];

class Slide {
  Slide({
    required this.title,
    required this.details
  });

  final String title;
  final String details;
}

var slides = List.generate( 6, (index) =>
  Slide(
    title: 'Slide ${index + 1}',
    details: description[index],
  ),
);

final List<Widget> sliders = slides.map((item) =>
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 480,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Text(item.details),
          ),
        ],
      ),
    ),
  ),
).toList();

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final CarouselController _controller = CarouselController();
  bool _start = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Urine Collection"),
        centerTitle: true,
      ),

      body: _start?
        ListView(
          children: [

          ],
        )
        :Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterCarousel(
                items: sliders,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.82,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  floatingIndicator: true,
                  enableInfiniteScroll: false,
                  controller: _controller,
                  slideIndicator: CircularWaveSlideIndicator(
                    alignment: Alignment.bottomCenter,
                    currentIndicatorColor: Colors.black,
                    indicatorBackgroundColor: Colors.grey,
                    indicatorBorderWidth: 10,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ),
              // const SizedBox(height: 16.0),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 16.0,
              //     vertical: 16.0,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Flexible(
              //         child: ElevatedButton(
              //           onPressed: _controller.previousPage,
              //           child: const Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Icon(Icons.arrow_back),
              //           ),
              //         ),
              //       ),
              //       Flexible(
              //         child: ElevatedButton(
              //           onPressed: _controller.nextPage,
              //           child: const Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Icon(Icons.arrow_forward),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
    );
  }
}

