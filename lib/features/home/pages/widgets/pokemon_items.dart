import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/home/pages/widgets/type.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(pokemon.name),
        Row(
          children: [
            Column(
              children: pokemon.type.map((e) => Types(name: e)).toList(),
            ),
            Image.network(pokemon.image)
          ],
        )
      ],
    );
  }
}
