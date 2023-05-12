import 'package:flutter/material.dart';
import 'package:pokedex/features/home/pages/home_page.dart';
import 'package:pokedex/initial_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String detail = 'detail';
  static const String home = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) => const InitialPage());
      case detail:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No page Route Provided'),
            ),
          ),
        );
    }
  }
}
