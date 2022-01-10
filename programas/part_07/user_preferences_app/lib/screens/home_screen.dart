import 'package:flutter/material.dart';
import 'package:user_preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('HomeScreen'))),
        drawer: SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Is Dark mode:'),
            Divider(),
            Text('Genero:'),
            Divider(),
            Text('Nombre de ususario:'),
            Divider(),
          ],
        ));
  }
}
