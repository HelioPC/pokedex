import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';

final pokemonDataProvider = FutureProvider((ref) async {
  return ref.watch(pokemonProvider).getAllPokemons();
});
