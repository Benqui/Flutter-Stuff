import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_readrer_and_gps/providers/ui_provider.dart';

import 'package:qr_readrer_and_gps/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomeScreen(),
          'mapa': (BuildContext context) => MapScreen()
        },
      ),
    );
  }
}
