import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int cont = 0; //propiedad
  void increase() {
    cont++;
    setState(() {});
  }

  void decrease() {
    cont--;
    setState(() {});
  }

  void reset() {
    cont = 0;
    setState(() {});
  }

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
      floatingActionButton: CustomButtonActions(
        increaseFunc: increase,
        decreaseFunc: decrease,
        resetFunc: reset,
      ),
    );
  }
}

class CustomButtonActions extends StatelessWidget {
  final Function increaseFunc, decreaseFunc, resetFunc;

  const CustomButtonActions({
    Key? key,
    required this.increaseFunc,
    required this.decreaseFunc,
    required this.resetFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.add),
          // onPressed: () => setState(() => cont++),
          onPressed: () => increaseFunc(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_zero_outlined),
          // onPressed: () => setState(() => cont = 0),
          onPressed: () => resetFunc(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.remove),
          // onPressed: () => setState(() => cont--),
          onPressed: () => decreaseFunc(),
        ),
      ],
    );
  }
}
