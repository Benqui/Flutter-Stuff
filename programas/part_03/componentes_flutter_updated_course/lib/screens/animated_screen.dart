import 'dart:math';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadius _borderRadius = BorderRadius.circular(15);

  void changeShape() => setState(() {
        final random = Random();
        _width = random.nextInt(300).toDouble() + 20;
        _height = random.nextInt(300).toDouble() + 20;
        _borderRadius =
            BorderRadius.circular(random.nextInt(300).toDouble() + 10);
        _color = Color.fromRGBO(
            random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Animation'),
      )),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          // color: Colors.red,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.play_circle_fill_outlined,
          size: 35,
        ),
        onPressed: changeShape,
      ),
    );
  }
}
