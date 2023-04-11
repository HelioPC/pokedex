import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/consts/api.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

final pokemonProvider = Provider((ref) => PokemonRepo(dio: Dio()));

class PokemonRepo {
  final Dio dio;

  PokemonRepo({required this.dio});

  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response =
          await dio.get('${ApiConsts.pokeapiURL}pokemon?limit=400');
      List<Pokemon> list = [];
      for (final p in response.data['results']) {
        final pResponse =
            await dio.get('${ApiConsts.pokeapiURL}pokemon/${p['name']}');
        list.add(Pokemon.fromMap(pResponse.data));
      }
      return list;
    } catch (e) {
      throw Failure(msg: 'Não foi possível carregar os dados');
    }
  }
}
