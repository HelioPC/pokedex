import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/common/consts/api.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class IPokemonRepo {
  Future<List<dynamic>> getAllPokemons();
}

class PokemonRepo implements IPokemonRepo {
  final Dio dio;

  PokemonRepo({required this.dio});

  @override
  Future<List<dynamic>> getAllPokemons() async {
    try {
      final response =
          await dio.get('${ApiConsts.pokeapiURL}pokemon?limit=1290');
      print(response.data);
      return [];
    } catch (e) {
      throw Failure(msg: 'Não foi possível carregar os dados');
    }
  }
}
