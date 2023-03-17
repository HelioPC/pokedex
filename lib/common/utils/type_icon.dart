import 'package:flutter/material.dart';

Icon choose(
  String type, {
  double customSize = 18,
  Color color = Colors.black,
}) {
  switch (type.toLowerCase()) {
    case 'grass':
      return Icon(
        Icons.grass,
        size: customSize,
        color: color,
      );
    case 'fire':
      return Icon(
        Icons.local_fire_department,
        size: customSize,
        color: color,
      );
    case 'water':
      return Icon(
        Icons.water,
        size: customSize,
        color: color,
      );
    case 'electric':
      return Icon(
        Icons.bolt,
        size: customSize,
        color: color,
      );
    case 'ice':
      return Icon(
        Icons.ac_unit,
        size: customSize,
        color: color,
      );
    case 'fighting':
      return Icon(
        Icons.play_for_work,
        size: customSize,
        color: color,
      );
    case 'poison':
      return Icon(
        Icons.science,
        size: customSize,
        color: color,
      );
    case 'ground':
      return Icon(
        Icons.broken_image,
        size: customSize,
        color: color,
      );
    case 'flying':
      return Icon(
        Icons.airlines,
        size: customSize,
        color: color,
      );
    case 'psychic':
      return Icon(
        Icons.psychology,
        size: customSize,
        color: color,
      );
    case 'bug':
      return Icon(
        Icons.pest_control,
        size: customSize,
        color: color,
      );
    case 'rock':
      return Icon(
        Icons.terrain,
        size: customSize,
        color: color,
      );
    case 'ghost':
      return Icon(
        Icons.contrast,
        size: customSize,
        color: color,
      );
    case 'dark':
      return Icon(
        Icons.nightlight,
        size: customSize,
        color: color,
      );
    case 'dragon':
      return Icon(
        Icons.whatshot,
        size: customSize,
        color: color,
      );
    case 'steel':
      return Icon(
        Icons.shield,
        size: customSize,
        color: color,
      );
    case 'fairy':
      return Icon(
        Icons.face,
        size: customSize,
        color: color,
      );
    default:
      return Icon(
        Icons.catching_pokemon,
        size: customSize,
        color: color,
      );
  }
}

List<Color> getColor(String type) {
  switch (type.toLowerCase()) {
    case 'grass':
      return const [Color.fromARGB(255, 126, 200, 80)];
    case 'fire':
      return const [Color.fromARGB(255, 255, 0, 0)];
    case 'water':
      return const [Color.fromARGB(255, 0, 221, 255)];
    case 'electric':
      return const [Color.fromARGB(255, 255, 238, 0)];
    case 'ice':
      return const [Color.fromARGB(255, 67, 141, 252)];
    case 'fighting':
      return const [Color.fromARGB(255, 138, 245, 158)];
    case 'poison':
      return const [Color.fromARGB(255, 185, 81, 255)];
    case 'ground':
      return const [Color.fromARGB(255, 255, 198, 141)];
    case 'flying':
      return const [Color.fromARGB(255, 92, 168, 255)];
    case 'psychic':
      return const [Color.fromARGB(255, 254, 61, 187)];
    case 'bug':
      return const [Color.fromARGB(255, 32, 255, 47)];
    case 'rock':
      return const [Color.fromARGB(255, 222, 184, 135)];
    case 'ghost':
      return const [Color.fromARGB(255, 173, 173, 173)];
    case 'dark':
      return const [Color.fromARGB(255, 149, 149, 149)];
    case 'dragon':
      return const [Color.fromARGB(255, 240, 81, 81)];
    case 'steel':
      return const [Color.fromARGB(255, 131, 139, 205)];
    case 'fairy':
      return const [Color.fromARGB(255, 249, 70, 130)];
    default:
      return const [Color.fromARGB(255, 156, 156, 156)];
  }
}
