import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductsService()),
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
      title: 'Productos App continuation',
      scaffoldMessengerKey: NotificationsService.messengerKey,
      // initialRoute: LoginScreen.routeName,
      initialRoute: CheckAuthScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ProductsScreen.routeName: (context) => const ProductsScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        CheckAuthScreen.routeName: (context) => const CheckAuthScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[350],
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.lightGreen),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.lightGreen,
          elevation: 0,
        ),
      ),
    );
  }
}
