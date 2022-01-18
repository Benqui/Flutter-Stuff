import 'package:flutter/material.dart';
import 'package:notifications_proyect/screens/screens.dart';
import 'package:notifications_proyect/services/push_notif_service.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    PushNotificationsService.messageStream.listen((message) {
      // print('my app: $message');

      navigatorKey.currentState
          ?.pushNamed(MessageScreen.routeName, arguments: message);

      final snackBar = SnackBar(content: Text(message));
      scaffoldKey.currentState?.showSnackBar(snackBar);
      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Material App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MessageScreen.routeName: (context) => MessageScreen(),
      },
    );
  }
}
