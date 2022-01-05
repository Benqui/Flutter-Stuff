import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_readrer_and_gps/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    // final currentIdex = 0;
    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Maps'),
        BottomNavigationBarItem(
            icon: Icon(Icons.link_sharp), label: 'Directions'),
      ],
    );
  }
}
