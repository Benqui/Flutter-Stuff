import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_readrer_and_gps/providers/ui_provider.dart';
import 'package:qr_readrer_and_gps/screens/direcciones_screen.dart';
import 'package:qr_readrer_and_gps/screens/mapas_screens.dart';
import 'package:qr_readrer_and_gps/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('Historial'),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.delete_forever_outlined))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return MapasScreen();

      case 1:
        return DireccionesScreen();

      default:
        return MapasScreen();
    }
  }
}
