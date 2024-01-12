import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.txt, required this.animation});
  final String txt;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: FadeTransition(
        opacity: animation, //점점진해지게
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1.0, //애니메이션이 아래쪽부터 올라오면서 글자 안잘림
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Text("HY"),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "id or name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(txt),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
