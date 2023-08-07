import 'package:flutter/material.dart';
import 'package:pokedex/auth_or_home_page.dart';
import 'package:pokedex/features/auth/pages/auth_page.dart';
import 'package:pokedex/features/details/pages/detail_page.dart';
import 'package:pokedex/features/home/pages/home_page.dart';
import 'package:pokedex/features/onboard/initial_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String detail = 'detail';
  static const String home = 'home';
  static const String auth = 'auth';
  static const String authOrHome = 'auth_or_home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authOrHome:
        return MaterialPageRoute(builder: (context) => const AuthOrHomePage());
      case auth:
        return MaterialPageRoute(builder: (context) => const AuthPage());
      case welcome:
        return MaterialPageRoute(builder: (context) => const InitialPage());
      case detail:
        return MaterialPageRoute(builder: (context) => const DetailPage());
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
