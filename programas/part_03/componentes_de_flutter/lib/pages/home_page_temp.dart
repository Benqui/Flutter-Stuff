import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes Temp')),
      body: ListView(
        children: _crearItemsShort(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(const Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsShort() {
    return opciones.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e + '!!'),
            subtitle: const Text('Helikopter helikopter'),
            leading: const Icon(Icons.account_balance_outlined),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {},
          ),
          const Divider(),
        ],
      );
    }).toList();
  }
  // List<Widget> _crearItemsShort() {
  //   var widgets = opciones.map((item) {
  //     return ListTile(
  //       title: Text(item + '!'),
  //     );
  //   }).toList();
  //   return widgets;
  // }
}
