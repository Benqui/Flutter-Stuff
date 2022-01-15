import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculas_app/theme/app_theme.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailsScreen(),
      },
      theme: AppTheme.clearTheme,
    );
  }
}
