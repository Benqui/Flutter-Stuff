import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //todo stateles widget tiene un build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text('hola mundo'),
      ),
    );
  }
}
