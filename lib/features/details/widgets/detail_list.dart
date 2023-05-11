import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/details/widgets/detail_item_list.dart';

class DetailList extends StatelessWidget {
  const DetailList({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.baseColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150),
          ),
        ),
        child: SizedBox(
          height: 250,
          width: double.infinity,
          child: PageView(
            onPageChanged: ((value) => onChangePokemon(list[value])),
            controller: controller,
            children: list.map((e) {
              bool diff = e.name != pokemon.name;
              return DetailItemList(
                diff: diff,
                pokemon: e,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
