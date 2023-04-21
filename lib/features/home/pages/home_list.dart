import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/home/pages/widgets/pokemon_items.dart';

class HomeList extends StatefulWidget {
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
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.pokeList.isNotEmpty
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 0),
              child: ListView.separated(
                itemCount: widget.pokeList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 25);
                },
                itemBuilder: (context, index) {
                  return PokemonItem(
                    pokemon: widget.pokeList.elementAt(index),
                    index: widget.getIndex(widget.pokeList.elementAt(index)),
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
