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
              height: 20,
            ),
            CustomCard2(
              imageUrl: 'https://wallpaperaccess.com/full/722917.jpg',
              name: 'Super Ido Tu hermana',
            ),
            SizedBox(
              height: 20,
            ),
            CustomCard2(
              imageUrl: 'https://wallpapercave.com/wp/wp9612618.jpg',
              name: 'Melelepipi',
            ),
            SizedBox(
              height: 20,
            ),
            CustomCard2(
              imageUrl: 'https://wallpapercave.com/wp/wp5406518.jpg',
              name: 'John Xina',
            ),
            SizedBox(
              height: 20,
            ),
            CustomCard2(
              imageUrl:
                  'https://areajugones.sport.es/wp-content/uploads/2020/03/steve-carell-the-office.jpg',
            ),
          ],
        ));
  }
}
