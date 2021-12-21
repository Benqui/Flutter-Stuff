import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('The office')),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const CircleAvatar(
              child: Text('B H'),
              backgroundColor: Colors.indigoAccent,
            ),
          )
        ],
      ),
      body: const Center(
          child: CircleAvatar(
        maxRadius: 120,
        backgroundImage: NetworkImage(
            'https://areajugones.sport.es/wp-content/uploads/2020/03/steve-carell-the-office.jpg'),
      )),
    );
  }
}
