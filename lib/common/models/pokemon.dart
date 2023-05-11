import 'package:flutter/material.dart';
import 'package:pokedex/common/models/base.dart';
import 'package:pokedex/common/models/evolution.dart';
import 'package:pokedex/common/models/profile.dart';

class Pokemon with ChangeNotifier {
  final int id;
  final Map<String, dynamic> name;
  final String description;
  final String species;
  final Profile profile;
  final Map<String, dynamic> images;
  final Base base;
  final Evolution evolution;
  final List<dynamic> types;
  bool favorite;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      species: json['species'],
      profile: Profile.fromMap(json['profile']),
      images: json['image'],
      base: Base.fromMap(json['base']),
      evolution: Evolution.fromMap(json['evolution']),
      types: json['type'],
      favorite: false,
    );
  }

  Pokemon({
    required this.id,
    required this.name,
    required this.description,
    required this.species,
    required this.profile,
    required this.images,
    required this.base,
    required this.evolution,
    required this.types,
    this.favorite = false,
  });

  void toggleFavorite() {
    favorite = !favorite;
    notifyListeners();
  }

  Pokemon copyWith({required bool isFavorite}) {
    return Pokemon(
      id: id,
      name: name,
      description: description,
      species: species,
      profile: profile,
      images: images,
      base: base,
      evolution: evolution,
      types: types,
      favorite: isFavorite,
    );
  }

  Color? get baseColor => getColor(type: types[0]);
  String get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

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
