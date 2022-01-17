import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  static const String routeName = 'message';

  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Message Screen says:'),
        ),
      ),
      body: Center(
        child: Text('MessageScreen'),
      ),
    );
  }
}
