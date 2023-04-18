import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/utils/type_icon.dart';
import 'package:pokedex/features/details/pages/widgets/detail_basic_info.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          toCapitalCase((pokemon.name['english'] as String)),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Nº ',
            style: const TextStyle(
              color: Color.fromRGBO(75, 75, 75, 1),
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: formatNumber(pokemon.id),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 47,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: pokemon.types.length,
            itemBuilder: (contex, index) => Chip(
              elevation: 5,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              backgroundColor: Pokemon.getColor(
                type: pokemon.types.elementAt(index),
              )!
                  .withOpacity(.7),
              avatar: CircleAvatar(
                backgroundColor: Colors.white,
                child: choose(
                  pokemon.types.elementAt(index),
                  customSize: 20,
                  color: Pokemon.getColor(
                        type: pokemon.types.elementAt(index),
                      ) ??
                      Colors.grey,
                ),
              ),
              label: Text(
                toCapitalCase(pokemon.types.elementAt(index)),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        const Divider(),
        DetailBasicInfo(pokemon: pokemon),
      ],
    );
  }
}
