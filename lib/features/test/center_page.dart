import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/test/pokemon_item.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key, required this.list}) : super(key: key);

  final List<Pokemon> list;

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget.list.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 24, right: 24, bottom: 0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return PokemonItem(
                      pokemon: widget.list.elementAt(index),
                      index: index,
                    );
                  },
                ),
              )
            : const Center(
                child: Text('No pokemons available'),
              ),
      ),
    );
  }
}
