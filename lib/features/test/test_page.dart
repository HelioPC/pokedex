import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/features/test/center_page.dart';

import 'home_error.dart';
import 'home_loading.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key, required this.repo}) : super(key: key);

  final IPokemonRepo repo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: repo.getAllPokemons(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoad();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return CenterPage(
            list: snapshot.data!,
          );
        } else {
          return HomeError(error: (snapshot.error as Failure).msg!);
        }
      }),
    );
  }
}
