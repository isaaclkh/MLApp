
import 'package:first/catheter/catheter_shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

class CatheterCountScreen extends StatefulWidget {
  const CatheterCountScreen({super.key});

  @override
  State<CatheterCountScreen> createState() => _CatheterCountScreenState();
}

class _CatheterCountScreenState extends State<CatheterCountScreen> {

  final totalControl = TextEditingController();
  final todayDate = DateTime.now();
  final FocusNode totalTextFocus = FocusNode();
  final FocusNode receiveTextFocus = FocusNode();
  final FocusNode endTextFocus = FocusNode();
  DateTime endDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);

  bool receivedSpeedButtonToday = true;
  bool endSpeedButton1Month = true;

  final pref = CatheterSharedPrefs();
  late bool testingPref;

  late bool yesNo = true;
  late int totalC = 0;
  final txtController = TextEditingController();
  late int dayPer = 0;
  late int initialC = 0;
  late int initPer = 0;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        if (pref.hasCatheter) {
          yesNo = pref.catheter;
          totalC = pref.totalC;
          initialC = pref.initialC;
          dayPer = pref.per;
          initPer = pref.initPer;
        }
        else {
          yesNo = false;
          totalC = 0;
          dayPer = 0;
          initialC = 0;
          initPer = 0;
        }
        print("yesNo: $yesNo");
      });
    });
    print("init");
    // TODO: implement initState
    super.initState();
  }

  void _setTotal(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: AlertDialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: const Text("Catheter status"),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("1️⃣ Enter your total catheter", style: TextStyle(fontSize: 18,),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: txtController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'total catheter ex) 30',
                      ),
                    ),

                    const SizedBox(height: 30,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("2️⃣ Select the due date", style: TextStyle(fontSize: 18,),),
                      ],
                    ),
                    DatePickerWidget(
                      looping: true,
                      firstDate: DateTime(todayDate.year, todayDate.month, todayDate.day + 1),
                      dateFormat: "dd/MMMM/yyyy",
                      onChange: (DateTime newDate, _){
                        setState(() {
                          endDate = newDate;
                        });
                        print(endDate);
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                        txtController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: (){
                        if(txtController.text.isEmpty){
                          pref.totalC = 0;
                          pref.initialC = 0;
                        }
                        else{
                          pref.totalC = int.parse(txtController.text);
                          pref.initialC = int.parse(txtController.text);
                        }

                        pref.endDate = DateFormat("yyyyMMdd").format(endDate).toString();
                        print("end date ${pref.endDate}");

                        pref.catheter = true;
                        print("saved");

                        bool? testprint = pref.catheter;
                        print(testprint);

                        int diff = endDate.difference(todayDate).inDays + 2;
                        print("date diff $diff");

                        int per = (pref.totalC / diff).floor();

                        pref.per = per;
                        print("per $per ${pref.per}");
                        pref.initPer = per;

                        setState(() {
                          yesNo = pref.catheter;
                          totalC = pref.totalC;
                          initialC = pref.totalC;
                          dayPer = pref.per;
                          initPer = pref.per;
                        });
                        txtController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }

  void _calculate(){

  }

  void _howToUse(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: const Text("[How To Use]"),
            content: const Text(
              "If you use one Catheter then press button 1 Used.\nIf you want to modify total number of catheter, then just simply press the number.",
              style: TextStyle(fontSize: 20,),
            ),
            actions: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catheter Counting"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: _howToUse, icon: const Icon(Icons.info),),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child:  Text("Per day", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            const SizedBox(height: 10,),
            InkWell(
              onTap: _setTotal,
              focusColor: Colors.transparent,
              child: Text("$dayPer", style: const TextStyle(fontSize: 150, fontWeight: FontWeight.bold),),
            ),

            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 150,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(40, 88, 123, 1),
                ),
                onPressed: (){
                  setState(() {
                    dayPer--;
                    totalC--;
                    pref.per = dayPer;
                    pref.totalC = totalC;
                  });
                },
                child: const Text("1 Used", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 100,),
              child: Row(
                children: [
                  const Text("Total Catether", style: TextStyle(fontSize: 18,),),
                  const Spacer(flex: 1,),
                  Text("${pref.totalC} / ${pref.initialC}", style: const TextStyle(fontSize: 18,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10,),
              child: Row(
                children: [
                  const Text("Daily Status", style: TextStyle(fontSize: 18,),),
                  const Spacer(flex: 1,),
                  Text("${pref.per} / ${pref.initPer}", style: const TextStyle(fontSize: 18,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10,),
              child: Row(
                children: [
                  const Text("Due Date", style: TextStyle(fontSize: 18,),),
                  const Spacer(flex: 1,),
                  Text("${pref.endDate[0]}${pref.endDate[1]}${pref.endDate[2]}${pref.endDate[3]} / ${pref.endDate[4]}${pref.endDate[5]} / ${pref.endDate[6]}${pref.endDate[7]}", style: const TextStyle(fontSize: 18,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30,),
              child: Row(
                children: [
                  const Text("D-day", style: TextStyle(fontSize: 18,),),
                  const Spacer(flex: 1,),
                  endDate != todayDate? Text("D-${endDate.difference(todayDate).inDays + 1}", style: const TextStyle(fontSize: 18,),)
                      : const Text("D-DAY", style: TextStyle(fontSize: 18,),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
