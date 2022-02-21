import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    Key? key,
    required this.pokemon,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);

  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.chevron_left),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 350),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          pokemon.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
