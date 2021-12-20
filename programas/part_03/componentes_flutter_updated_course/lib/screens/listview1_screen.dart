import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  final options = const ['megamente', 'metroman', 'Titan', 'Servil'];
  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('ListView tipo 1'),
          ),
        ),
        body: ListView(
          children: [
            ...options
                .map((e) => ListTile(
                      title: Text(e),
                      leading: const Icon(Icons.account_box_rounded),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ))
                .toList(),
          ],
        ));
  }
}
