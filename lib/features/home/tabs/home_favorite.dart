import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:provider/provider.dart';

class HomeFavorite extends StatelessWidget {
  const HomeFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonState>(
      builder: (context, value, child) {
        return value.favorites.isEmpty
            ? const Center(
                child: Text('No favourites pokemons'),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    childAspectRatio: 400 / 100,
                  ),
                  itemCount: value.favorites.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: value.favorites[index].baseColor,
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
                                  value.favorites[index].image,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  (value.favorites[index].name['english']
                                      as String),
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
                              onPressed: () {},
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
      },
    );
  }
}
