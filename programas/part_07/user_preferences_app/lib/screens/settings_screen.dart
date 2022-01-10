import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences_app/providers/theme_provider.dart';
import 'package:user_preferences_app/shared_preferenes/preferences.dart';
import 'package:user_preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Benqui';

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
                  value: Preferences.isDarkMode,
                  onChanged: (value) {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLigthMode();
                    setState(() {});
                  },
                  title: const Text('Dark Mode'),
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Masculino'),
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Femenino'),
                  value: 2,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
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
