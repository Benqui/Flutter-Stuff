import 'package:componentes_flutter_updated_course/router/app_routes.dart';
import 'package:componentes_flutter_updated_course/themes/app_theme.dart';
import 'package:flutter/material.dart';

// import 'package:componentes_flutter_updated_course/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Componentes en Flutter'),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(AppRoutes.menuOptions[index].name),
                  leading: Icon(
                    AppRoutes.menuOptions[index].icon,
                    color: AppTheme.primary,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined,
                      color: AppTheme.primary),
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.menuOptions[index].route),
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
