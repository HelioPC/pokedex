import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';

final pokemonDataProvider =
    StateNotifierProvider<PokemonDataProvider, List<Pokemon>>((ref) {
  return PokemonDataProvider(ref: ref);
});

final favouritesProvider = StateProvider<List<Pokemon>>((ref) {
  final res = ref
      .watch(pokemonDataProvider)
      .where((poke) => poke.favorite == true)
      .toList();
  return res;
});

class PokemonDataProvider extends StateNotifier<List<Pokemon>> {
  PokemonDataProvider({required this.ref}) : super([]) {
    getPokemons(ref: ref);
  }

  final Ref ref;

  Future getPokemons({required Ref ref}) async {
    await ref.read(pokemonRepoProvider).getAllPokemons().then((value) {
      state = value;
    });
  }

  void toggleFavorite(int id) {
    var newState = state.map((p) {
      if (p.id == id) {
        return p.copyWith(isFavorite: !p.favorite);
      }

      return p;
    }).toList();

    state = newState;
  }
}
