import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';

class DetailBasicInfo extends StatelessWidget {
  const DetailBasicInfo({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> infos = [
      {
        'WEIGHT': pokemon.profile.weight,
        'icon': Icons.balance,
      },
      {
        'HEIGHT': pokemon.profile.height,
        'icon': Icons.height,
      },
      {
        'CATEGORY': toCapitalCase(pokemon.types[0] as String),
        'icon': Icons.category,
      },
      {
        'ABILITY': toCapitalCase(pokemon.profile.ability[0][0]),
        'icon': Icons.catching_pokemon,
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 20,
          children: infos
              .map(
                (e) => SizedBox(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            e.values.last,
                            color: Colors.black54,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            e.keys.first,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 192, 192, 192),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            e.values.first,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
