import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
              child: Image(
            image: NetworkImage(
                'https://i.kym-cdn.com/entries/icons/original/000/032/993/doyou.jpg'),
          )),
        ),
      ),
    );
  }
}
