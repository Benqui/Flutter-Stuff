import 'package:basic_design_01/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _HomeBody(),
        ],
      ),
      bottomNavigationBar: CustomButtonNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  // const _HomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Titles
          PageTitle(),

          //card table
          CardTable(),
        ],
      ),
    );
  }
}
