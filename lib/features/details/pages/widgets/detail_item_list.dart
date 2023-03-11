import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailItemList extends StatelessWidget {
  const DetailItemList({
    Key? key,
    required this.diff,
    required this.pokemon,
  }) : super(key: key);
  final bool diff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: diff ? .3 : 1,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
          tween: Tween<double>(
            begin: diff ? 300 : 100,
            end: diff ? 100 : 300,
          ),
          builder: ((context, value, child) {
            return Image.network(
              pokemon.image,
              width: value,
              fit: BoxFit.contain,
              color: diff ? Colors.black : null,
            );
          }),
        ),
      ),
    );
  }
}
