import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int cont = 0; //propiedad

  @override
  Widget build(BuildContext context) {
    const fonSizeclase = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Numero de clicks',
              style: fonSizeclase,
            ),
            Text('$cont', style: fonSizeclase),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              cont++;
              setState(() {}); //funcion anonima
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.exposure_zero_outlined),
            onPressed: () {
              cont = 0;
              setState(() {}); //funcion anonima
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              cont--;
              setState(() {}); //funcion anonima
            },
          ),
        ],
      ),
    );
  }
}
