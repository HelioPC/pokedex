import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:provider/provider.dart';

class FilterTypeButton extends StatefulWidget {
  const FilterTypeButton({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterTypeButton> createState() => _FilterTypeButtonState();
}

class _FilterTypeButtonState extends State<FilterTypeButton> {
  String label = 'All types';
  Color background = Colors.black;

  _showModalBottomSheetTypes(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose pokemon type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: [
                    ...Pokemon.pokemonTypes
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Provider.of<PokemonState>(
                                context,
                                listen: false,
                              ).filterPokemons(
                                toCapitalCase(e),
                              );
                              setState(() {
                                label = e;
                                background = Pokemon.getColor(
                                      type: e,
                                    ) ??
                                    Colors.black;
                              });
                            },
                            child: FilterChip(
                              backgroundColor: Pokemon.getColor(
                                type: e,
                              )!
                                  .withOpacity(.2),
                              selectedColor: Pokemon.getColor(
                                type: e,
                              )!
                                  .withOpacity(.5),
                              selected: Provider.of<PokemonState>(context)
                                  .typeFilters
                                  .contains(toCapitalCase(e)),
                              onSelected: (value) {
                                if (value) {
                                  Provider.of<PokemonState>(context,
                                          listen: false)
                                      .addTypeFilter(toCapitalCase(e));
                                } else {
                                  Provider.of<PokemonState>(context,
                                          listen: false)
                                      .removeTypeFilter(toCapitalCase(e));
                                }
                              },
                              label: Text(
                                e,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    Visibility(
                      visible: Provider.of<PokemonState>(context)
                          .typeFilters
                          .isEmpty,
                      replacement: IconButton(
                        onPressed: () {
                          Provider.of<PokemonState>(context, listen: false)
                              .clearTypeFilters();
                        },
                        icon: const Icon(Icons.close),
                      ),
                      child: const SizedBox(),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalBottomSheetTypes(context),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
