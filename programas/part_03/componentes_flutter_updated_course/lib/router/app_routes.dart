import 'package:componentes_flutter_updated_course/models/models.dart';
import 'package:componentes_flutter_updated_course/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // TODO: borrar home
    // MenuOption(
    //     route: 'home',
    //     screen: HomeScreen(),
    //     name: 'Home Screen',
    //     icon: Icons.home_sharp),
    MenuOption(
        route: 'list1',
        screen: ListView1Screen(),
        name: 'Listview tipo 1',
        icon: Icons.list_alt_rounded),
    MenuOption(
        route: 'list2',
        screen: ListView2Screen(),
        name: 'Listview tipo 2',
        icon: Icons.list),
    MenuOption(
        route: 'alert',
        screen: AlertScreen(),
        name: 'Alert Screen',
        icon: Icons.do_disturb_on_sharp),
    MenuOption(
        route: 'card',
        screen: CardScreen(),
        name: 'Card Screen',
        icon: Icons.credit_card),
    MenuOption(
        route: 'avatar',
        screen: AvatarScreen(),
        name: 'Avatar Screen',
        icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: 'animation',
        screen: AnimationScreen(),
        name: 'Animation Screen',
        icon: Icons.play_circle_filled_outlined),
    MenuOption(
        route: 'input',
        screen: InputScreen(),
        name: 'Input Screen',
        icon: Icons.input_outlined),
    MenuOption(
        route: 'slider',
        screen: SliderScreen(),
        name: 'Slider Screen',
        icon: Icons.slideshow_rounded),
    MenuOption(
        route: 'lv-builder',
        screen: ListViewBuilderScreen(),
        name: 'Listview Builder Screen',
        icon: Icons.slideshow_rounded),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => HomeScreen(),
  //   'list1': (BuildContext context) => ListView1Screen(),
  //   'list2': (BuildContext context) => ListView2Screen(),
  //   'alert': (BuildContext context) => AlertScreen(),
  //   'card': (BuildContext context) => CardScreen(),
  // };
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
