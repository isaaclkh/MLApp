import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UrineCollectionListWidget extends StatefulWidget {
  const UrineCollectionListWidget({super.key});

  @override
  State<UrineCollectionListWidget> createState() => _UrineCollectionListWidgetState();
}

class _UrineCollectionListWidgetState extends State<UrineCollectionListWidget> {

  void _addingModal(){
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0, top: 11),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close, size: 25,),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Add Data", style: TextStyle(fontSize: 20,),),
                    ),
                  ),
                ],
              ),

              const Divider(color: Color(0xffDDDDDD),),

              const Text("Modal Bottom Sheet"),
              ElevatedButton(
                onPressed: (){

                },
                child: const Text("Close"),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20,),
            child: TextButton(
              onPressed: _addingModal,
              child: Text("Add"),
            ),
          ),
        )

      ],
    );
  }
}
