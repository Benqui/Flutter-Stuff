import 'package:flutter/material.dart';
import 'package:hola_mundo_y_contador/screens/counter_screen.dart';
import 'package:hola_mundo_y_contador/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //todo stateles widget tiene un build
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
