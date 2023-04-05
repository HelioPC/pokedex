import 'package:flutter/material.dart';
import 'package:pokedex/common/models/ability.dart';
import 'package:pokedex/common/models/stats.dart';
import 'package:pokedex/common/models/types.dart';

class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final Map<String, dynamic> sprites;
  final List<Types> types;
  final List<Ability> abilities;
  final List<Stats> stats;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      sprites: json['sprites'],
      types: List<Types>.from(json['types'].map((x) => Types.fromMap(x))),
      abilities:
          List<Ability>.from(json['abilities'].map((x) => Ability.fromMap(x))),
      stats: List<Stats>.from(json['stats'].map((x) => Stats.fromMap(x))),
    );
  }

  Color? get baseColor => getColor(type: types[0].type['name'] ?? 'normal');
  String get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  Pokemon({
    required this.stats,
    required this.abilities,
    required this.types,
    required this.sprites,
    required this.height,
    required this.weight,
    required this.name,
    required this.id,
  });

  static Color? getColor({required String type}) {
    switch (type.toLowerCase()) {
      case 'normal':
        return Colors.grey;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'ice':
        return Colors.cyanAccent[400];
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.brown;
      case 'flying':
        return Colors.indigo[200];
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen[500];
      case 'rock':
        return Colors.grey;
      case 'ghost':
        return Colors.indigo[400];
      case 'dark':
        return Colors.black;
      case 'dragon':
        return Colors.indigo[800];
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
