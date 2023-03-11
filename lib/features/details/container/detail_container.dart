import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/common/widgets/loading.dart';
import 'package:pokedex/common/widgets/error.dart';
import 'package:pokedex/features/details/pages/detail_page.dart';

class DetailArgs {
  final Pokemon pokemon;
  final int? index;

  DetailArgs({this.index, required this.pokemon});
}

class DetailContainer extends StatefulWidget {
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
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: .6,
      initialPage: widget.args.index!,
    );
    _future = widget.repo.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _pokemon ??= widget.args.pokemon;

          return DetailPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: controller,
            onChangePokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        } else {
          return Error(error: (snapshot.error as Failure).msg!);
        }
      }),
    );
  }
}
