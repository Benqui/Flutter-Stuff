import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/screens/home_screen.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  ),
                  // _LoginForm(),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Crear una nueva cuenta',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hinText: '  example@example.com',
                  labelText: 'Email',
                  prefixIcon: Icons.email_outlined),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo no es valido';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(
                hinText: '  * * * * *',
                labelText: 'Password',
                prefixIcon: Icons.lock_clock_outlined,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'la contraseña debe de ser de 6 o mas caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Colors.lightGreen,
              elevation: 0,
              color: Colors.lightGreen,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere' : 'Ingresar',
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      if (!loginForm.isValidForm()) {
                        return;
                      }
                      loginForm.isLoading = true;
                      await Future.delayed(Duration(seconds: 2));

                      //todo:validar que el login es correcto

                      loginForm.isLoading = false;
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    },
            )
          ],
        ),
      ),
    );
  }
}
