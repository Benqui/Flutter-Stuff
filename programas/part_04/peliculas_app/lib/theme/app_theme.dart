import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(195, 121, 245, 1);

  static final ThemeData clearTheme = ThemeData.light().copyWith(
    //** App Bar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
  );
}
