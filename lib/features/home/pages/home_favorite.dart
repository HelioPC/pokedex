import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class HomeFavorite extends StatefulWidget {
  const HomeFavorite(
      {Key? key, required this.pokeList, required this.removeFavorite})
      : super(key: key);

  final List<Pokemon> pokeList;
  final Function(Pokemon pokemon) removeFavorite;

  @override
  State<HomeFavorite> createState() => _HomeFavoriteState();
}

class _HomeFavoriteState extends State<HomeFavorite> {
  @override
  Widget build(BuildContext context) {
    return widget.pokeList.isEmpty
        ? const Center(
            child: Text('No pokemons available'),
          )
        : Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                childAspectRatio: 400 / 100,
              ),
              itemCount: widget.pokeList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: widget.pokeList[index].baseColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              widget.pokeList[index].image,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              widget.pokeList[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          highlightColor: Colors.white.withOpacity(.2),
                          onPressed: () {
                            widget.removeFavorite(widget.pokeList[index]);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
