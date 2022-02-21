import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/features/home/pages/home_error.dart';
import 'package:pokedex/features/home/pages/home_loading.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repo}) : super(key: key);
  final IPokemonRepo repo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repo.getAllPokemons(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoad();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        } else {
          return HomeError(error: snapshot.error.toString());
        }
      }),
    );
  }
}
