import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoadign) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Productos'),
        ),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (context, i) => GestureDetector(
          child: ProductCard(
            product: productsService.products[i],
          ),
          onTap: () {
            productsService.selectedProduct =
                productsService.products[i].copy();
            Navigator.pushNamed(context, ProductsScreen.routeName);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct =
              Product(available: false, price: 0.0, name: '');
          Navigator.pushNamed(context, ProductsScreen.routeName);
        },
      ),
    );
  }
}
