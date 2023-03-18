import 'package:flutter/material.dart';

Icon choose(
  String type, {
  double customSize = 18,
  Color color = Colors.black,
}) {
  switch (type.toLowerCase()) {
    case 'grass':
      return Icon(
        Icons.spa,
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
