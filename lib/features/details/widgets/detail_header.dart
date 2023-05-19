import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/widgets/pokemon_type_labels_row.dart';
import 'package:pokedex/features/details/widgets/detail_basic_info.dart';

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
          child: PokemonTypeLabelsRow(pokemon: pokemon),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            pokemon.description,
            style: const TextStyle(fontSize: 14, letterSpacing: 0, height: 2),
          ),
        ),
        const Divider(),
        DetailBasicInfo(pokemon: pokemon),
        const Divider(),
        GFProgressBar(
          backgroundColor: Colors.grey,
          progressBarColor: Colors.grey,
        ),
      ],
    );
  }
}
