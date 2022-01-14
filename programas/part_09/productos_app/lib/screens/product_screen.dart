import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'product_screen';

  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct!),
      child: _ProductsScreenBody(productsService: productsService),
    );
  }
}

class _ProductsScreenBody extends StatelessWidget {
  const _ProductsScreenBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(
                  url: productsService.selectedProduct!.picture,
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 25,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt_outlined,
                        color: Colors.white, size: 40),
                    onPressed: () async {
                      //todo: camara o galeria
                      final picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        // imageQuality: 100,
                      );

                      if (pickedFile == null) {
                        print('no selecciono nada ');
                        return;
                      }
                      // final String? imageUrl =
                      //     await productsService.uploadImage();
                      print('tenemos nudes (imagen) ${pickedFile.path}');
                      productsService
                          .updateSelectedProductImage(pickedFile.path);
                      // productsService
                      //     .updateSelectedProductImage(pickedFile.path);
                    },
                  ),
                ),
              ],
            ),
            _ProductForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: productsService.isSaving
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(
                Icons.save_outlined,
                size: 30,
              ),
        onPressed: productsService.isSaving
            ? null
            : () async {
                if (!productFormProvider.isValidForm()) return;
                final String? imageUrl = await productsService.uploadimage();
                print(imageUrl);
                if (imageUrl != null) {
                  productFormProvider.product.picture = imageUrl;
                }

                //* *La funcion de guardado del producto NO BORRAR
                await productsService
                    .saveAllCreataProduct(productFormProvider.product);

                //TODO: cuando todo jale bien shilo habilitar esta madre
                // Navigator.pop(context);
              },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final product = productFormProvider.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        // height: 200,
        decoration: _buildDecorationBox(),
        child: Form(
          key: productFormProvider.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if (value == null || value.length <= 3) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                    hinText: 'Nombre del producto', labelText: 'Nombre: '),
              ),
              SizedBox(height: 30),
              TextFormField(
                initialValue: '\$ ${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (double.tryParse(value) == null) {
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                    hinText: '\$150', labelText: 'Precio: '),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                value: product.available,
                title: Text('Disponible: '),
                activeColor: Colors.lightGreen,
                onChanged: productFormProvider.updateAvailability,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecorationBox() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5,
            )
          ]);
}
