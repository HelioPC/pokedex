import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';

class DetailBasicInfo extends StatelessWidget {
  const DetailBasicInfo({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _infos = [
      {
        'WEIGHT': '${pokemon.weight / 10} kg',
        'icon': Icons.balance,
      },
      {
        'HEIGHT': '${pokemon.height / 10} m',
        'icon': Icons.height,
      },
      {
        'CATEGORY': toCapitalCase(pokemon.types[0].type['name']),
        'icon': Icons.category,
      },
      {
        'ABILITY': toCapitalCase(pokemon.abilities[0].ability['name']),
        'icon': Icons.catching_pokemon,
      },
    ];
    return SizedBox(
      width: double.infinity,
      height: 270,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 1.8,
        ),
        itemCount: _infos.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _infos.elementAt(index).values.last,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _infos[index].keys.first,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 192, 192, 192)),
                ),
                elevation: 0,
                child: SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      _infos[index].values.first,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
