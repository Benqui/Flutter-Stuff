import 'package:flutter/material.dart';
import 'package:user_preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Settings_Screen'))),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  value: true,
                  onChanged: (value) {},
                  title: const Text('Dark Mode'),
                ),
                const Divider(),
                RadioListTile(
                  title: const Text('Masculino'),
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
                const Divider(),
                RadioListTile(
                  title: const Text('Femenino'),
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    initialValue: 'Benqui',
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del Ususario',
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
