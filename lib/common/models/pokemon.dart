import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final double spawnChance;
  final String name;
  final String num;
  final String height;
  final String weight;
  final String egg;
  final String spawnTime;
  final List<String> weaknesses;
  final List<String> type;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      egg: json['egg'],
      height: json['height'],
      spawnChance: json['spawn_chance'].toDouble(),
      spawnTime: json['spawn_time'],
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      weight: json['weight'],
    );
  }

  Color? get baseColor => _color(type: type[0]);
  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  Pokemon({
    required this.spawnChance,
    required this.height,
    required this.weight,
    required this.egg,
    required this.spawnTime,
    required this.weaknesses,
    required this.name,
    required this.type,
    required this.id,
    required this.num,
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
