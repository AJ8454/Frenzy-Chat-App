import 'package:flutter/material.dart';
import 'chat_screen.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frenzy Chat'),
        centerTitle: true,
      ),
      body: new ChatScreen(),
    );
  }
}
