import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: const [
          FadeInImage(
            image: NetworkImage('https://wallpaperaccess.com/full/785842.jpg'),
            placeholder: AssetImage('assets/images/jar-loading.gif'),
          )
        ],
      ),
    );
  }
}
