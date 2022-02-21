import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/details/pages/widgets/detail_app_bar.dart';
import 'package:pokedex/features/details/pages/widgets/detail_list.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DetailAppBar(
          pokemon: pokemon,
          onBack: onBack,
        ),
        DetailList(
          pokemon: pokemon,
          list: list,
          controller: controller,
          onChangePokemon: onChangePokemon,
        ),
      ],
    ));
  }
}
