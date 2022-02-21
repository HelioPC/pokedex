import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailList extends StatelessWidget {
  const DetailList({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      height: 340,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: PageView(
                onPageChanged: ((value) => onChangePokemon(list[value])),
                controller: controller,
                children: list
                    .map(
                      (e) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: e != pokemon ? .3 : 1,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                          tween: Tween<double>(
                            begin: e != pokemon ? 300 : 100,
                            end: e != pokemon ? 100 : 300,
                          ),
                          builder: ((context, value, child) {
                            return Center(
                              child: Image.network(
                                e.image,
                                width: value,
                                fit: BoxFit.contain,
                                color: e != pokemon ? Colors.black : null,
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
