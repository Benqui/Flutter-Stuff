import 'package:basic_design_01/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
        'basic_design': (BuildContext context) => BasicDesignScreen(),
        'scroll_design': (BuildContext context) => ScrollScreen(),
        'home_screen': (BuildContext context) => HomeScreen()
      },
    );
  }
}
