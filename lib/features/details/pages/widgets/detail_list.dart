import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/details/pages/widgets/detail_item_list.dart';

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
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
