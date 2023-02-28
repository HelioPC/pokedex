import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/pages/widgets/type.dart';

class PokemonItem extends StatefulWidget {
  const PokemonItem({
    Key? key,
    required this.pokemon,
    required this.onTap,
    required this.index,
    required this.onDoubleTap,
  }) : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArgs) onTap;
  final Function(Pokemon pokemon) onDoubleTap;
  final int index;

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  var loved = false;

  void toggleLoved() {
    setState(() {
      loved = !loved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => {widget.onDoubleTap(widget.pokemon), toggleLoved()},
      onTap: () => widget.onTap(
        '/details',
        DetailArgs(
          pokemon: widget.pokemon,
          index: widget.index,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.pokemon.baseColor!.withOpacity(1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 12,
                left: 12,
                bottom: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.pokemon.num,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          loved
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 18,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.pokemon.type
                            .map((e) => Types(name: e))
                            .toList(),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            right: 0,
            child: Image.network(
              widget.pokemon.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
