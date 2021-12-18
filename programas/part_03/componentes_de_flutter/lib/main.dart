import 'package:flutter/material.dart';

import 'package:componentes_de_flutter/pages/home_page.dart';
// import 'package:componentes_de_flutter/pages/home_page_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Componentes App',
        home: HomePage());
  }
}
