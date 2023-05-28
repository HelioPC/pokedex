import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';

class PokemonState with ChangeNotifier {
  List<Pokemon> _list = [];
  List<Pokemon> _searchPokemons = [];
  final List<String> _typeFilters = [];
  Pokemon? _currentPokemon;
  bool _error = false;
  String _errorMessage = '';

  List<Pokemon> get list => _list;
  List<Pokemon> get searchedPokemons => _searchPokemons;
  List<Pokemon> get favorites => _list.where((p) => p.favorite).toList();
  List<String> get typeFilters => _typeFilters;
  Pokemon get currentPokemon => _currentPokemon!;
  bool get hasError => _error;
  String get errorMessage => _errorMessage;

  void addTypeFilter(String type) {
    _typeFilters.add(type);
    _searchPokemons = list.where((p) {
      return _typeFilters.isEmpty ||
          p.types.any((t) => _typeFilters.contains(t));
    }).toList();
    notifyListeners();
  }

  void removeTypeFilter(String type) {
    _typeFilters.remove(type);
    _searchPokemons = list.where((p) {
      return _typeFilters.isEmpty ||
          p.types.any((t) => _typeFilters.contains(t));
    }).toList();
    notifyListeners();
  }

  void clearTypeFilters() {
    _typeFilters.clear();
    _searchPokemons = list.where((p) {
      return _typeFilters.isEmpty ||
          p.types.any((t) => _typeFilters.contains(t));
    }).toList();
    notifyListeners();
  }

  void filterPokemons(String text) {
    if (text.isEmpty) {
      _searchPokemons = list.where((p) {
        return _typeFilters.isEmpty ||
            p.types.any((t) => _typeFilters.contains(t));
      }).toList();
    } else {
      _searchPokemons = list
          .where((p) {
            return _typeFilters.isEmpty ||
                p.types.any((t) => _typeFilters.contains(t));
          })
          .toList()
          .where(
            (p) {
              if (Pokemon.pokemonTypes.contains(text.toLowerCase())) {
                return p.types.contains(toCapitalCase(text));
              }

              return (p.name['english'] as String)
                      .toLowerCase()
                      .contains(text.toLowerCase()) ||
                  p.id.toString().toLowerCase().contains(text.toLowerCase());
            },
          )
          .toList();
    }
    notifyListeners();
  }

  void removeFavorite(Pokemon pokemon) {
    pokemon.toggleFavorite();
    notifyListeners();
  }

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
      _searchPokemons = _list;

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
