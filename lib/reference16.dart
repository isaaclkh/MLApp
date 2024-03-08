import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class Reference16 extends StatefulWidget {
  const Reference16({super.key});

  @override
  State<Reference16> createState() => _Reference16State();
}

class _Reference16State extends State<Reference16> with TickerProviderStateMixin{
  final todayString = DateFormat.yMMMd().format(DateTime.now());
  late final AnimationController _waveController;

  @override
  void initState(){
    super.initState();
    _waveController = AnimationController(vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
    _waveController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          todayString,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(

              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.modulate),
                child: Lottie.asset(
                  "assets/wave.json",
                  controller: _waveController,
                  onLoaded: (composition){
                    _waveController.duration = composition.duration;
                    _waveController.repeat(reverse: true,);
                  }
                ),
              ),
            ),
            // Container(
            //   color: Colors.red,
            //   height: 100,
            // ),
            const Padding(
              padding: EdgeInsets.only(bottom: 250,),
              child: Align(
                alignment: Alignment.center,
                child: Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lv 3", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      Text("FREE to do your activities"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
