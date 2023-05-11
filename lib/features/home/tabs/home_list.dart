import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/features/home/widgets/pokemon_items.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonState>(
      builder: (context, state, child) {
        return Container(
          child: state.list.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 24, right: 24, bottom: 0),
                  child: ListView.separated(
                    itemCount: state.list.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 25);
                    },
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: state.list[index],
                        child: PokemonItem(),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text('No pokemons available'),
                ),
        );
      },
    );
  }
}
