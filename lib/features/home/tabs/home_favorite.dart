import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/widgets/pokemon_type_labels_row.dart';
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: value.favorites.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(value.favorites[index].id),
                      onDismissed: (direction) {
                        Provider.of<PokemonState>(context, listen: false)
                            .removeFavorite(value.favorites[index]);
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        color: Theme.of(context).colorScheme.error,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      confirmDismiss: (direction) {
                        return showCupertinoModalPopup<bool>(
                          context: context,
                          builder: (ctx) {
                            return CupertinoActionSheet(
                              title: const Text('Are you sure?'),
                              message: Text(
                                'Remove ${value.favorites[index].name['english']} from favorites',
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(true);
                                  },
                                  child: const Text('Confirm'),
                                ),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(false);
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        decoration: BoxDecoration(
                          color:
                              value.favorites[index].baseColor!.withOpacity(.2),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 16, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nº ${formatNumber(value.favorites[index].id)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        (value.favorites[index].name['english']
                                            as String),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  PokemonTypeLabelsRow(
                                    pokemon: value.favorites[index],
                                    padding: const EdgeInsets.only(right: 8),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: 150,
                              decoration: BoxDecoration(
                                color: value.favorites[index].baseColor!
                                    .withOpacity(.7),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 15,
                                    right: 15,
                                    child: Image.asset(
                                      'lib/assets/images/${(value.favorites[index].types[0] as String).toLowerCase()}.png',
                                      height: 120,
                                      width: 120,
                                      color: Colors.white.withOpacity(.3),
                                    ),
                                  ),
                                  Positioned(
                                    top: 35,
                                    right: 35,
                                    child: Image.network(
                                      value.favorites[index].image,
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
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: value.favorites[index].favorite
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.white,
                                              ),
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
                  },
                ),
              );
      },
    );
  }
}
