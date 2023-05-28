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
  static List<String> get pokemonTypes {
    return [
      'normal',
      'fire',
      'water',
      'grass',
      'electric',
      'ice',
      'fighting',
      'poison',
      'ground',
      'flying',
      'psychic',
      'bug',
      'rock',
      'ghost',
      'dark',
      'dragon',
      'steel',
      'fairy',
    ];
  }

  static Color? getColor({required String type}) {
    switch (type.toLowerCase()) {
      case 'normal':
        return const Color(0xFF919AA2);
      case 'fire':
        return const Color(0xFFFF9D55);
      case 'water':
        return const Color(0xFF5090D6);
      case 'grass':
        return const Color(0xFF63BC5A);
      case 'electric':
        return const Color(0xFFF4D23C);
      case 'ice':
        return const Color(0xFF73CEC0);
      case 'fighting':
        return const Color(0xFFCE416B);
      case 'poison':
        return const Color(0xFFB567CE);
      case 'ground':
        return const Color(0xFFD97845);
      case 'flying':
        return const Color(0xFF89AAE3);
      case 'psychic':
        return const Color(0xFFFA7179);
      case 'bug':
        return const Color(0xFF91C12F);
      case 'rock':
        return const Color(0xFFC5B78C);
      case 'ghost':
        return const Color(0xFF5269AD);
      case 'dark':
        return const Color(0xFF5A5465);
      case 'dragon':
        return const Color(0xFF0B6DC3);
      case 'steel':
        return const Color(0xFF5A8EA2);
      case 'fairy':
        return const Color(0xFFEC8FE6);
      default:
        return Colors.grey;
    }
  }
}
