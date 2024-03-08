import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'chat_message.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  final textCnt = TextEditingController();
  final GlobalKey<AnimatedListState> _aniListKey = GlobalKey<AnimatedListState>();
  final List<String> _chats = [];

  Widget _buildItem(context, index, animation){
    return ChatMessage(txt: _chats[index], animation: animation,);
  }

  void _handleSubmitted(String text) {
    Logger().d(text);

    textCnt.clear();
    _chats.insert(0, text);
    _aniListKey.currentState?.insertItem(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Testing"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedList(
                shrinkWrap: true,
                key: _aniListKey,
                reverse: true,
                itemBuilder: _buildItem,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textCnt,
                    decoration: const InputDecoration(hintText: "명령어를 입력하세요"),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                TextButton(
                  onPressed: () => _handleSubmitted(textCnt.text),
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70,),
        ],
      ),
    );
  }
}
