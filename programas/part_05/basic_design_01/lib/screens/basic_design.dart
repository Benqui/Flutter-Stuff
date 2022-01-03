import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage("assets/landscape.jpg")),
          SizedBox(height: 10),
          Title(),
          ButtonSection()
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Casas shilas barata 10 peso',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Baratas a 10 peso',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Button(
            icon: Icons.call,
            content: 'CALL',
          ),
          // SizedBox(width: 30),
          Button(
            icon: Icons.directions,
            content: 'ROUTE',
          ),
          // SizedBox(width: 30),
          Button(
            icon: Icons.share,
            content: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final String content;
  const Button({
    Key? key,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.lightBlue,
        ),
        const SizedBox(height: 5),
        Text(
          content,
          style: const TextStyle(color: Colors.lightBlue),
        )
      ],
    );
  }
}
