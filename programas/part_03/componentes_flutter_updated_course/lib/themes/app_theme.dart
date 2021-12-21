import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //color primario
      primaryColor: Colors.indigo,

      //appBar theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      //Text button theme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

      //floating action button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, backgroundColor: primary),
      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: AppTheme.primary,
        shape: const StadiumBorder(),
        elevation: 0,
      )));

  //Dark mode/theme
  static final ThemeData dartTheme = ThemeData.dark().copyWith(
    //color primario
    primaryColor: Colors.indigo,

    //appBar theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    scaffoldBackgroundColor: Colors.black,
  );
}
