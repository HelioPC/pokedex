import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/features/test/test_page.dart';

class PokedexRoute extends StatelessWidget {
  final PokemonRepo repo;
  const PokedexRoute({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          /*return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repo: repo,
                onItemTap: (route, args) {
                  Navigator.of(context).pushNamed(route, arguments: args);
                },
              );
            },
          );*/
          return MaterialPageRoute(
            builder: (context) {
              return TestPage(
                repo: repo,
              );
            },
          );
        }

        /*if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repo: repo,
                args: (settings.arguments as DetailArgs),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }*/

        return null;
      },
    );
  }
}
