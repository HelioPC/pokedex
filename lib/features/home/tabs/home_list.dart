import 'package:flutter/cupertino.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/features/home/widgets/pokemon_items.dart';
import 'package:provider/provider.dart';

class HomeList extends StatefulWidget {
  const HomeList({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  TextEditingController searchController = TextEditingController(text: '');
  late String _searchText;

  @override
  void initState() {
    super.initState();
    searchController.addListener(
      () {
        setState(() {
          _searchText = searchController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 0,
        left: 24,
        right: 24,
        bottom: 0,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 18),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xffe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.search,
                      color: Color.fromRGBO(128, 128, 128, 1),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            Provider.of<PokemonState>(context, listen: false)
                                .searchPokemons(_searchText);
                          });
                        },
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          searchController.clear();
                          Provider.of<PokemonState>(context, listen: false)
                              .searchPokemons('');
                        });
                      },
                      child: const Icon(
                        CupertinoIcons.clear_thick_circled,
                        color: Color.fromRGBO(128, 128, 128, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Consumer<PokemonState>(
            builder: (context, value, child) {
              return Visibility(
                visible: value.searchedPokemons.isNotEmpty,
                replacement: const Center(
                  child: Text('No pokemons available'),
                ),
                child: Expanded(
                  child: ListView.separated(
                    itemCount: value.searchedPokemons.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 25);
                    },
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: value.searchedPokemons[index],
                        child: PokemonItem(
                          key: ValueKey(value.searchedPokemons[index].id),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
