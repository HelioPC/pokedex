import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/common/widgets/loading.dart';
import 'package:pokedex/common/widgets/error.dart';
import 'package:pokedex/features/details/pages/detail_page.dart';

class DetailArgs {
  final Pokemon pokemon;

  DetailArgs({required this.pokemon});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.repo,
    required this.args,
    required this.onBack,
  }) : super(key: key);
  final IPokemonRepo repo;
  final DetailArgs args;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repo.getAllPokemons(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(
            pokemon: args.pokemon,
            list: snapshot.data!,
            onBack: onBack,
          );
        } else {
          return Error(error: (snapshot.error as Failure).msg!);
        }
      }),
    );
  }
}
