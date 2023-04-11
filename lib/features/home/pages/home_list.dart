import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/home/pages/widgets/pokemon_items.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    Key? key,
    required this.pokeList,
    required this.onDoubleTap,
    required this.favorites,
    required this.getIndex,
  }) : super(key: key);

  final List<Pokemon> pokeList;
  final List<Pokemon> favorites;
  final Function(Pokemon pokemon) onDoubleTap;
  final int Function(Pokemon pokemon) getIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: pokeList.isNotEmpty
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: pokeList.length,
                itemBuilder: (context, index) {
                  return PokemonItem(
                    pokemon: pokeList.elementAt(index),
                    onDoubleTap: onDoubleTap,
                    index: getIndex(pokeList.elementAt(index)),
                    loved: favorites.contains(pokeList.elementAt(index)),
                  );
                },
              ),
            )
          : const Center(
              child: Text('No pokemons available'),
            ),
    );
  }
}
