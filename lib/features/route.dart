import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  final PokemonRepo repo;
  const PokedexRoute({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repo: repo,
                onItemTap: (route, args) {
                  Navigator.of(context).pushNamed(route, arguments: args);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repo: repo,
                args: (settings.arguments as DetailArgs),
              );
            },
          );
        }

        return null;
      },
    );
  }
}
