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
          toCapitalCase(pokemon.name),
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Nº',
              style: TextStyle(
                color: Color.fromRGBO(75, 75, 75, 1),
                fontSize: 20,
              ),
            ),
            Text(
              formatNumber(pokemon.id),
              style: const TextStyle(
                color: Color.fromRGBO(75, 75, 75, 1),
                fontSize: 20,
              ),
            ),
          ],
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
              backgroundColor:
                  getColor(pokemon.types.elementAt(index).type['name'])[0],
              avatar: CircleAvatar(
                backgroundColor: Colors.white,
                child: choose(
                  pokemon.types.elementAt(index).type['name'],
                  customSize: 25,
                  color:
                      getColor(pokemon.types.elementAt(index).type['name'])[0],
                ),
              ),
              label: Text(
                toCapitalCase(pokemon.types.elementAt(index).type['name']),
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
