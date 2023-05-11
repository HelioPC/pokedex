import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/widgets/pokemonTypeLabelsRow.dart';
import 'package:provider/provider.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context, listen: false);

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: pokemon.baseColor!.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nº ${formatNumber(pokemon.id)}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      (pokemon.name['english'] as String),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                PokemonTypeLabelsRow(
                  pokemon: pokemon,
                  padding: const EdgeInsets.only(right: 8),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 150,
            decoration: BoxDecoration(
              color: pokemon.baseColor!.withOpacity(.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  right: 15,
                  child: Image.asset(
                    'lib/assets/images/${(pokemon.types[0] as String).toLowerCase()}.png',
                    height: 120,
                    width: 120,
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
                Positioned(
                  top: 35,
                  right: 35,
                  child: Image.network(
                    pokemon.image,
                    height: 85,
                    width: 85,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.25),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Consumer<Pokemon>(
                      builder: (context, value, child) {
                        return IconButton(
                          onPressed: () {
                            pokemon.toggleFavorite();
                          },
                          icon: pokemon.favorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
