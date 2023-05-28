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
                    ...Pokemon.pokemonTypes.map((e) {
                      final color = Pokemon.getColor(
                        type: e,
                      );
                      return GestureDetector(
                        onTap: () {
                          Provider.of<PokemonState>(
                            context,
                            listen: false,
                          ).filterPokemons(
                            toCapitalCase(e),
                          );
                        },
                        child: FilterChip(
                          backgroundColor: color!.withOpacity(.8),
                          checkmarkColor: color.computeLuminance() < .35
                              ? Colors.white
                              : Colors.black,
                          selectedColor: color,
                          selected: Provider.of<PokemonState>(context)
                              .typeFilters
                              .contains(toCapitalCase(e)),
                          onSelected: (value) {
                            if (value) {
                              Provider.of<PokemonState>(context, listen: false)
                                  .addTypeFilter(toCapitalCase(e));
                            } else {
                              Provider.of<PokemonState>(context, listen: false)
                                  .removeTypeFilter(toCapitalCase(e));
                            }
                          },
                          label: Text(
                            e,
                            style: TextStyle(
                              color: color.computeLuminance() < .35
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Type',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
