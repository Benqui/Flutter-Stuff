import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
                iconData: Icons.ac_unit, color: Colors.blue, text: 'General'),
            _SingleCard(
                iconData: Icons.safety_divider_outlined,
                color: Colors.green,
                text: 'People'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                iconData: Icons.code, color: Colors.purpleAccent, text: 'Code'),
            _SingleCard(
                iconData: Icons.bookmark_border,
                color: Colors.brown,
                text: 'books'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                iconData: Icons.music_note,
                color: Colors.orange,
                text: 'music'),
            _SingleCard(
                iconData: Icons.play_arrow_outlined,
                color: Colors.pinkAccent,
                text: 'Memes'),
          ],
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard({
    Key? key,
    required this.iconData,
    required this.color,
    required this.text,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(
            iconData,
            size: 35,
            color: Colors.white,
          ),
          radius: 30,
        ),
        const SizedBox(height: 10),
        Text(text,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ))
      ],
    );
    return _CardBackground(child: column);
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            // margin: const EdgeInsets.all(15),
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
