import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';

class DetailBasicInfo extends StatelessWidget {
  const DetailBasicInfo({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _infos = [
      {'PESO': '${pokemon.weight / 10} kg'},
      {'ALTURA': '${pokemon.height / 10} m'},
      {'CATEGORIA': toCapitalCase(pokemon.types[0].type['name'])},
      {'HABILIDADE': toCapitalCase(pokemon.abilities[0].ability['name'])},
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
          mainAxisSpacing: 20,
          childAspectRatio: 1.8,
        ),
        itemCount: _infos.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.balance,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _infos[index].keys.first,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                      255,
                      196,
                      196,
                      196,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    _infos[index].values.first,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
