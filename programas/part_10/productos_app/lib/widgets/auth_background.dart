import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _GreenBox(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin_circle_outlined,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _GreenBox extends StatelessWidget {
  const _GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _buildBoxDecoration(),
      child: Stack(
        children: const [
          Positioned(child: _Balls(), top: 90, left: 30),
          Positioned(child: _Balls(), top: -40, left: -30),
          Positioned(child: _Balls(), top: -50, right: -10),
          Positioned(child: _Balls(), bottom: -50, right: 10),
          Positioned(child: _Balls(), bottom: 60, right: -50),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(91, 235, 114, 1),
          Color.fromRGBO(118, 245, 95, 1)
        ],
      ));
}

class _Balls extends StatelessWidget {
  const _Balls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(218, 245, 95, 0.25)),
    );
  }
}
