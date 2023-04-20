import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/providers/pokemon_data_provider.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

class HomeContainer extends ConsumerWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pokemonDataProvider);
    return data.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : HomePage(list: data);
  }
}
