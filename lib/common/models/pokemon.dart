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

  Color? get baseColor => _color(type: types[0].type['name'] ?? 'normal');
  String get image =>
      sprites['front_default'] ??
      'https://raw.githubusercontent.com/PokeAPI'
          '/sprites/master/sprites/pokemon/$id.png';

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

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
