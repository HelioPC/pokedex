import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/utils/type_icon.dart';

class PokemonTypeLabelsRow extends StatelessWidget {
  const PokemonTypeLabelsRow({
    Key? key,
    required this.pokemon,
    this.padding,
  }) : super(key: key);

  final Pokemon pokemon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: pokemon.types
          .map(
            (type) => Padding(
              padding: padding ?? const EdgeInsets.all(8.0),
              child: Chip(
                elevation: 5,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                backgroundColor: Pokemon.getColor(
                  type: type,
                )!
                    .withOpacity(.8),
                avatar: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: choose(
                    type,
                    customSize: 20,
                    color: Pokemon.getColor(
                          type: type,
                        ) ??
                        Colors.grey,
                  ),
                ),
                label: Text(
                  toCapitalCase(type),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
