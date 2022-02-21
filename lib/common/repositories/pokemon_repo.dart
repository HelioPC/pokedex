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
      final response = await dio.get(ApiConsts.pokeapiURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(msg: 'Não foi possível carregar os dados');
    }
  }
}
