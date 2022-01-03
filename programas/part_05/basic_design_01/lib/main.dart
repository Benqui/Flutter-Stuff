import 'package:flutter/material.dart';
import 'package:basic_design_01/screens/basic_design.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'basic_design',
      routes: {
        'basic_design': (BuildContext context) => BasicDesignScreen(),
      },
    );
  }
}
