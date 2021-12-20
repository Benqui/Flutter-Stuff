import 'package:flutter/material.dart';

import 'package:componentes_flutter_updated_course/screens/listview2_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(body: ListView2Screen()),
    );
  }
}
