
import 'package:first/account_setting/account_setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  late int level;
  late int maxLevel;
  late int levelIdx;
  late StateMachineController _stmController;
  SMIInput<double>? _numberExampleInput;
  ValueNotifier<double> batteryValue = ValueNotifier(0);

  List<String> result = ['2024/02/26/16/00/00/669', '2023/10/29/17/31/17/669'];

  List<String> cmtTitle = ["\nFREE", "\nPREPARE", "\n!!WARNING!!"];
  List<Color> cmtColors = [Colors.green, Colors.orange, Colors.red];
  List<Color> cardColors = [const Color.fromRGBO(200,225,204, 1), const Color.fromRGBO(255,215,105, 1), const Color.fromRGBO(253,216,216,1)];
  List<Color> infoColors = [const Color.fromRGBO(143,182,171, 1), const Color.fromRGBO(231,159,49, 1), const Color.fromRGBO(238,114,114,1)];
  List<Color> batteryColors = [const Color.fromRGBO(200,225,204, 1), const Color.fromRGBO(255,215,105, 1), const Color.fromRGBO(253,216,216,1)];

  DateTime current = DateTime.now();
  late Stream timer;

  @override
  initState(){
    super.initState();
    level = 3;
    maxLevel = 8;
    levelIdx = 0;
    batteryValue.value = 100;

    timer = Stream.periodic(const Duration(minutes: 1), (x){
      setState(() {
        current = current.add(const Duration(minutes: 1),);
      });
      return current;
    });

    timer.listen((event) {
      if(kDebugMode){
        print("current time: $event");
      }
    });
 }

 @override
  void dispose() {
    // TODO: implement dispose
   _stmController.dispose();
   super.dispose();
  }

 void _riveOneInit(Artboard art){
    _stmController = StateMachineController.fromArtboard(art, 'State Machine 1') as StateMachineController;
    _stmController.isActive = true;
    art.addController(_stmController);
    _numberExampleInput = _stmController.findInput<double>('Number 1') as SMINumber;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      setState(() {
        _numberExampleInput?.value = levelIdx.toDouble();
      });
    });
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

  String parseTimeStamp(String str){
    var spStr = str.split("/");
    var finalStr = spStr[0];// year
    finalStr += "/";
    finalStr += spStr[1]; // month
    finalStr += "/";
    finalStr += spStr[2]; // day
    finalStr += "/";
    finalStr += spStr[3]; // hour
    finalStr += ":";
    finalStr += spStr[4]; // min
    finalStr += ":";
    finalStr += spStr[5]; // sec
    return finalStr;
  }

  final todayString = DateFormat.yMMMd().format(DateTime.now());

  String diffTime(String timeD){
    String resultStr;
    List<String> splitTimeD = timeD.split("/");
    String timeDToDateTime = "${splitTimeD[0]}-${splitTimeD[1]}-${splitTimeD[2]} ${splitTimeD[3]}:${splitTimeD[4]}:${splitTimeD[5]}";

    var timeDConvert = DateTime.parse(timeDToDateTime);
    Duration diff = current.difference(timeDConvert);
    resultStr = diff.toString().split('.').first.padLeft(8, "0");
    List<String> formatting = resultStr.split(":");
    resultStr = "";

    if(int.parse(formatting[0])>0) {
      resultStr += formatting[0];
      resultStr += "hour";
    }
    if(int.parse(formatting[1])>0) {
      if(resultStr != "") resultStr += " ";
      resultStr += formatting[1];
      resultStr += "min";
    }
    if(int.parse(formatting[2])>0) {
      if(resultStr != "") resultStr += " ";
      resultStr += formatting[2];
      resultStr += "sec";
    }

    if(int.parse(formatting[0])==0 && int.parse(formatting[1])==0 && int.parse(formatting[2])==0) {
      resultStr += "NOW";
    } else {
      resultStr += " before";
    }

    return resultStr;
  }


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
        toolbarHeight: 100,
        title: Text(todayString, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        actions: [
           const Column(
             mainAxisAlignment: MainAxisAlignment.center,
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15,),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.44,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        color: cardColors[levelIdx],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Container(
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(70)),
                              ),

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Spacer(flex: 1,),
                                  // BatteryIndicator(
                                  //   trackHeight: 17,
                                  //   value: 0.9,
                                  //   iconOutline: Colors.white,
                                  // ),
                                  const Icon(Icons.bolt_rounded, color: Colors.greenAccent, size: 30,),
                                  const SizedBox(width: 10,),
                                  const Text("MediLight", style: TextStyle(fontSize: 20, color: Colors.white),),
                                  const Spacer(flex: 2,),
                                  SizedBox(
                                    width: 53,
                                    height: 53,
                                    child: SimpleCircularProgressBar(
                                      valueNotifier: batteryValue,
                                      progressStrokeWidth: 3,
                                      backStrokeWidth: 3,
                                      mergeMode: true,
                                      animationDuration: 0,
                                      onGetText: (double value){
                                        return Text("${value.toInt()}", style: const TextStyle(color: Colors.white, fontSize: 20,),);
                                      },
                                    ),
                                  ),
                                  const Spacer(flex: 1,),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40,),
                          // Center(child: Lottie.asset('assets/walking.json', frameRate: FrameRate.max, width: 250, height: 230,)),
                          SizedBox(
                            // color: Colors.purpleAccent,
                            height: 180,
                            width: MediaQuery.of(context).size.height * 0.23,
                            child: RiveAnimation.asset(
                              "assets/rive/lil_guy.riv",
                              fit: BoxFit.fill,
                              onInit: _riveOneInit,
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15,),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        color: infoColors[levelIdx],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15,),
                          // Center(child: Lottie.asset('assets/walking.json', frameRate: FrameRate.max, width: 250, height: 230,)),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, right: 30.0,),
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
                  expandedHeight: MediaQuery.of(context).size.height * 0.13,
                  collapsedHeight: MediaQuery.of(context).size.height * 0.1,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
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

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 20,),
                    child: SizedBox(
                      height: 70,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: (){
                          Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const AccountSettingScreen()));
                        },
                        child: const Text("Go to accountSettings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 20, bottom: 10,),
                    child: Text("Measured Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  ),
                ),


                result.isEmpty?
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20,),
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.black54,
                        ),
                      ),
                      child: const Center(
                        child: Text("You haven't measure yet", style: TextStyle(fontSize: 18, color: Colors.black54),),
                      ),
                    ),
                  ),
                )
                : SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: 50.0 * result.length,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.black54,
                        )
                      ),
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: result.length,
                          itemBuilder: (BuildContext context, int index){
                            String parseString = parseTimeStamp(result[index]);
                            String diffStr = diffTime(result[index]);
                            return Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.77,
                                    height: 23,
                                    color: Colors.black12, child: Text(parseString, style: const TextStyle(color: Colors.black),),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.77,
                                    height: 23,
                                    color: Colors.black12, child: Text(diffStr, style: const TextStyle(color: Colors.blue),),
                                  ),
                                ],
                              ),
                            );

                          },
                        ),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
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
