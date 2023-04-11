import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/providers/pokemon_data_provider.dart';
import 'package:pokedex/features/details/pages/detail_page.dart';

class DetailArgs {
  final Pokemon currentPokemon;
  final int? index;

  DetailArgs({this.index, required this.currentPokemon});
}

class DetailContainer extends ConsumerStatefulWidget {
  const DetailContainer({
    Key? key,
    required this.args,
  }) : super(key: key);
  final DetailArgs args;

  @override
  ConsumerState<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends ConsumerState<DetailContainer> {
  late PageController controller;
  Pokemon? _pokemon;
  late List<Pokemon> list;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: .6,
      initialPage: widget.args.index!,
    );
    _pokemon = widget.args.currentPokemon;
    list = ref.read(pokemonDataProvider).value ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailPage(
      pokemon: _pokemon!,
      list: list,
      onBack: () => Navigator.pop(context),
      controller: controller,
      onChangePokemon: (Pokemon value) {
        setState(() {
          _pokemon = value;
        });
      },
    );
  }
}
