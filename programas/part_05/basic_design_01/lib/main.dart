import 'package:basic_design_01/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'scroll_design',
      routes: {
        'basic_design': (BuildContext context) => BasicDesignScreen(),
        'scroll_design': (BuildContext context) => ScrollScreen(),
      },
    );
  }
}
