import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/common/consts/api.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class IPokemonRepo {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepo implements IPokemonRepo {
  final Dio dio;

  PokemonRepo({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response =
          await dio.get('${ApiConsts.pokeapiURL}pokemon?limit=150');
      List<Pokemon> list = [];
      for (final p in response.data['results']) {
        final pResponse =
            await dio.get('${ApiConsts.pokeapiURL}pokemon/${p['name']}');
        list.add(Pokemon.fromMap(pResponse.data));
      }
      return list;
    } catch (e) {
      print(e);
      throw Failure(msg: 'Não foi possível carregar os dados');
    }
  }
}
