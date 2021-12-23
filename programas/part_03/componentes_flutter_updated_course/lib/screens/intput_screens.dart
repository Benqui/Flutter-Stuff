import 'package:componentes_flutter_updated_course/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, dynamic> formValues = {
      'nombre': 'Benqui',
      'apellidos': 'Hoyos Herrera',
      'emai': 'benqui@sandia.cum',
      'password': '123456',
      'role': 'admin',
    };
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Inputs y Forms'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  CustomInputField(
                    labelText: 'Nombre',
                    hintText: 'Nombre de usuario',
                    fromProperty: 'nombre',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    hintText: 'Apellidos de usuario',
                    labelText: 'Apellidos',
                    fromProperty: 'apellidos',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Email',
                    hintText: 'Correo del usuario',
                    keyboardType: TextInputType.emailAddress,
                    fromProperty: 'emai',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Password',
                    hintText: 'Passwd del usuario',
                    obscureText: true,
                    fromProperty: 'password',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                      DropdownMenuItem(value: 'sudo', child: Text('sudo')),
                      DropdownMenuItem(
                          value: 'developer', child: Text('developer')),
                      DropdownMenuItem(
                          value: 'developer_jr', child: Text('developer_jr')),
                    ],
                    onChanged: (value) {
                      print(value);
                      formValues['role'] = value ?? 'admin';
                    },
                  ),
                  ElevatedButton(
                    child: const SizedBox(
                      child: Center(child: Text('Guardar')),
                      width: double.infinity,
                    ),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (!myFormKey.currentState!.validate()) {
                        print('Formulario no valido');
                        return;
                      }
                      print(formValues);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
