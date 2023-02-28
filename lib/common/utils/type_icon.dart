import 'package:flutter/material.dart';

Icon choose(String type) {
  double customSize = 18;
  switch (type.toLowerCase()) {
    case 'grass':
      return Icon(Icons.grass, size: customSize);
    case 'fire':
      return Icon(Icons.local_fire_department, size: customSize);
    case 'water':
      return Icon(Icons.water, size: customSize);
    case 'electric':
      return Icon(Icons.bolt, size: customSize);
    case 'ice':
      return Icon(Icons.ac_unit, size: customSize);
    case 'fighting':
      return Icon(Icons.play_for_work, size: customSize);
    case 'poison':
      return Icon(Icons.science, size: customSize);
    case 'ground':
      return Icon(Icons.broken_image, size: customSize);
    case 'flying':
      return Icon(Icons.flutter_dash, size: customSize);
    case 'psychic':
      return Icon(
        Icons.psychology,
        size: customSize,
      );
    case 'bug':
      return Icon(Icons.pest_control, size: customSize);
    case 'rock':
      return Icon(Icons.terrain, size: customSize);
    case 'ghost':
      return Icon(Icons.contrast, size: customSize);
    case 'dark':
      return Icon(Icons.nightlight, size: customSize);
    case 'dragon':
      return Icon(Icons.whatshot, size: customSize);
    case 'steel':
      return Icon(Icons.shield, size: customSize);
    case 'fairy':
      return Icon(Icons.face, size: customSize);
    default:
      return Icon(Icons.catching_pokemon, size: customSize);
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
      return const [Color.fromARGB(255, 92, 255, 209)];
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
