import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/widgets/pokemonTypeLabelsRow.dart';
import 'package:pokedex/features/details/container/detail_container.dart';

class PokemonItem extends StatefulWidget {
  const PokemonItem({
    Key? key,
    required this.pokemon,
    required this.index,
    required this.onDoubleTap,
    required this.loved,
  }) : super(key: key);
  final Pokemon pokemon;
  final Function(Pokemon pokemon) onDoubleTap;
  final int index;
  final bool loved;

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => widget.onDoubleTap(widget.pokemon),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailContainer(
            args: DetailArgs(
              currentPokemon: widget.pokemon,
              index: widget.index,
            ),
          ),
        ));
      },
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: widget.pokemon.baseColor!.withOpacity(.2),
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
                        'Nº ${formatNumber(widget.pokemon.id)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        (widget.pokemon.name['english'] as String),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  PokemonTypeLabelsRow(
                    pokemon: widget.pokemon,
                    padding: const EdgeInsets.only(right: 8),
                  ),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: 150,
              decoration: BoxDecoration(
                color: widget.pokemon.baseColor!.withOpacity(.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Image.asset(
                      'lib/assets/images/${(widget.pokemon.types[0] as String).toLowerCase()}.png',
                      height: 120,
                      width: 120,
                      color: Colors.white.withOpacity(.3),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: 35,
                    child: Image.network(
                      widget.pokemon.image,
                      height: 85,
                      width: 85,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.25),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: widget.loved
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
