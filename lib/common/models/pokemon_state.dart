import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/common/models/pokemon.dart';

class PokemonState with ChangeNotifier {
  List<Pokemon> _list = [];
  Pokemon? _currentPokemon;
  bool _error = false;
  String _errorMessage = '';

  List<Pokemon> get list => _list;
  List<Pokemon> get favorites => _list.where((p) => p.favorite).toList();
  Pokemon get currentPokemon => _currentPokemon!;
  bool get hasError => _error;
  String get errorMessage => _errorMessage;

  void setCurrentPokemon(Pokemon pokemon) {
    _currentPokemon = pokemon;
    notifyListeners();
  }

  int getPokemonIndex(Pokemon pokemon) {
    return _list.indexOf(pokemon);
  }

  Future<void> fetchPokemons() async {
    try {
      final response =
          await rootBundle.loadString('lib/assets/json/pokemons.json');
      final data = await json.decode(response);

      _list = (data as List)
          .sublist(0, 809)
          .map((e) => Pokemon.fromMap(e))
          .toList();

      _error = false;
      _errorMessage = '';
    } catch (e) {
      _error = true;
      _errorMessage = 'Something went wrong';
    }

    notifyListeners();
  }

  void reset() {
    _list = [];
    _error = false;
    _errorMessage = '';

    notifyListeners();
  }
}
