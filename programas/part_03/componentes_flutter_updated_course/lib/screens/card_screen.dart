// import 'package:componentes_flutter_updated_course/themes/app_theme.dart';
import 'package:componentes_flutter_updated_course/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Card Widget')),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCard1(),
            SizedBox(
              height: 10,
            ),
            CustomCard2(),
          ],
        ));
  }
}
