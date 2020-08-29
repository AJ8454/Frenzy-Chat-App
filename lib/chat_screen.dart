import 'package:flutter/material.dart';
import 'package:flutter_chat/chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _message = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.green[900],
      ),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Send a message'),
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  onPressed: () {
                    _handleSubmitted(_textController.text);
                  },
                  icon: Icon(Icons.send),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _message[index],
          itemCount: _message.length,
        )),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposer(),
        )
      ],
    );
  }
}
