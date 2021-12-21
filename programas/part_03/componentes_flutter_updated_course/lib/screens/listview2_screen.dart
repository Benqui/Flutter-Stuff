import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final options = const ['megamente', 'metroman', 'Titan', 'Servil'];
  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(
            child: Text('ListView tipo 2'),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(options[index]),
                  leading: const Icon(
                    Icons.account_box_rounded,
                    color: Colors.purpleAccent,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.purpleAccent),
                  onTap: () {},
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: options.length));
  }
}
