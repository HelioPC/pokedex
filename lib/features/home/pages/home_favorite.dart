import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/providers/pokemon_data_provider.dart';

class HomeFavorite extends ConsumerWidget {
  const HomeFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(favouritesProvider);

    return data.isEmpty
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
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: data[index].baseColor,
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
                              data[index].image,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              (data[index].name['english'] as String),
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
                            ref
                                .read(pokemonDataProvider.notifier)
                                .toggleFavorite(data[index].id);
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
