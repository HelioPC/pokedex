import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

final pokemonProvider = Provider((ref) => PokemonRepo());

class PokemonRepo {
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response =
          await rootBundle.loadString('lib/assets/json/pokemons.json');
      final data = await json.decode(response);

      return (data as List)
          .sublist(0, 809)
          .map((e) => Pokemon.fromMap(e))
          .toList();
    } catch (e) {
      print('Ocorreu um erro');
      print(e.toString());
      throw Failure(msg: 'Não foi possível carregar os dados');
    }
  }
}
