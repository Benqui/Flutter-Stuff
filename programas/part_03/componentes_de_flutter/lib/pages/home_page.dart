import 'package:flutter/material.dart';
import 'package:componentes_de_flutter/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Componentes')),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data!),
        );
      },
      // initialData: ,
    );
    // return ListView(
    //   children: _listaItems(),
    // );
  }

  _listaItems(List<dynamic> data) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetemp = ListTile(
        title: Text(opt['texto']),
        leading: const Icon(
          Icons.ac_unit,
          color: Colors.blueGrey,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: Colors.blueGrey,
        ),
        onTap: () {},
      );
      opciones
        ..add(widgetemp)
        ..add(const Divider());
    });
    return opciones;
  }
}
