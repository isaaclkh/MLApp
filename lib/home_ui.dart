import 'package:cupertino_battery_indicator/cupertino_battery_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  late int level;
  late int maxLevel;
  late int levelIdx;

  List<String> cmtTitle = ["\nFREE", "\nPREPARE", "\n!!WARNING!!"];
  List<Color> cmtColors = [Colors.green, Colors.orange, Colors.red];

  @override
  initState(){
    super.initState();
    level = 4;
    maxLevel = 8;
    levelIdx = 1;
  }

  List<TextStyle> cmtTitleStyle = [
    const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green,
    ),
    const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange,
    ),
    const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red,
    ),
  ];

  List<String> cmt = [" to do your activities", " for your urination", "  do your catheterization",];
  TextStyle cmtStyle = const TextStyle(fontSize: 15, color: Colors.black,);

  TextSpan checkingCmt(){
    if(level < maxLevel/2){
        setState(() {
          levelIdx = 0;
        });

      return TextSpan(
        text: cmtTitle[0],
        style: cmtTitleStyle[0],
      );
    } else{
        setState(() {
          levelIdx = 1;
        });

      if(level == maxLevel/2){
        return TextSpan(
          text: cmtTitle[1],
          style: cmtTitleStyle[1],
        );
      }
      else{
          setState(() {
            levelIdx = 2;
          });

        return TextSpan(
          text: cmtTitle[2],
          style: cmtTitleStyle[2],
        );
      }
    }
  }



  final todayString = DateFormat.yMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Row(
          children: [
            Container(width: 20,),
            Image.asset("assets/logo.png", width: 80),
          ],
        ),
        leadingWidth: 100,
        title: Text(todayString, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        actions: [
          const Column(
            children: [
              Icon(Icons.link, size: 35,),
              Text("Linked", style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          Container(width: 25,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(  // 단일 위젯은 요걸로
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15, right: 15,),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: const Color.fromRGBO(178, 212, 182, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Lottie.asset('assets/walking.json', frameRate: FrameRate.max, width: 250, height: 230,)),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25,),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Current", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                const Spacer(flex: 1,),
                                Text("Lv. $level", style: const TextStyle(color: Color.fromRGBO(42, 77, 20, 1), fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 0.0, top: 5),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.82,
                              animation: false,
                              animationDuration: 1000,
                              lineHeight: 20.0,
                              percent: level/maxLevel,
                              center: Text("Lv. $level", style: const TextStyle(fontSize: 15,),),
                              progressColor: const Color.fromRGBO(42, 77, 20, 1),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5,),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Lv. $level", style: const TextStyle(color: Colors.white, fontSize: 17),),
                                const Spacer(flex: 1,),
                                Text("Lv. $maxLevel", style: const TextStyle(color: Colors.white, fontSize: 17),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 22,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30,),
                          child: BatteryIndicator(
                            trackHeight: 17,
                            value: 0.9,
                            iconOutline: Colors.white,
                          ),
                        ),
                        Container(width: 10,),
                        const Text("99%", style: TextStyle(fontSize: 18,),),
                      ],
                    ),
                  ),
                ),

                levelIdx < 2?
                const SliverToBoxAdapter()
                : const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),

                SliverAppBar(
                  scrolledUnderElevation: 0.0,
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.12,
                  collapsedHeight: MediaQuery.of(context).size.height * 0.09,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(left: 30.0, top: 5.0, right: 0.0, bottom: 15.0),
                    title: RichText(
                      text: TextSpan(
                        text: "Current Level: $level",
                        style: TextStyle(fontSize: 15, color: cmtColors[levelIdx]),
                        children: [
                          checkingCmt(),

                          level < maxLevel/2?
                          TextSpan(
                            text: cmt[0],
                            style: cmtStyle,
                          ) :
                          level == maxLevel/2?
                          TextSpan(
                            text: cmt[1],
                            style: cmtStyle,
                          ) :
                          TextSpan(
                            text: cmt[2],
                            style: cmtStyle,
                          ),
                        ],
                      ),
                    ),
                    centerTitle: false,
                  ),
                ),

                SliverToBoxAdapter(  // 단일 위젯은 요걸로
                  child: Container(
                    height: 500.0,
                    color: Colors.white,
                    child: const Center(
                      child: Text("Some Start Widgets"),
                    ),
                  ),
                ),

                SliverToBoxAdapter(  // 단일 위젯은 요걸로
                  child: Container(
                    height: 500.0,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text("Some Start Widgets"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
