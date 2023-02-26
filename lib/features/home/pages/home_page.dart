import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/pages/widgets/pokemon_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArgs) onItemTap;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchQuery = TextEditingController();

  List<Pokemon> _pokeList = [];

  int _currentIndex = 0;

  Widget searchBar = const Text(
    'Pokedex 2k23',
    style: TextStyle(
      fontSize: 24,
    ),
  );

  Icon appBarIcon = const Icon(
    Icons.search,
  );

  List<Icon> appBarIcons = const <Icon>[
    Icon(
      Icons.search,
    ),
    Icon(
      Icons.cancel,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _HomePageState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _pokeList = widget.list;
        });
      } else {
        setState(() {
          _pokeList = widget.list
              .where(
                (e) =>
                    e.name
                        .toLowerCase()
                        .contains(_searchQuery.text.toLowerCase()) ||
                    e.num.toLowerCase()
                        .contains(_searchQuery.text.toLowerCase()),
              )
              .toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pokeList = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        centerTitle: true,
        title: searchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (appBarIcon.icon == Icons.search) {
                  appBarIcon = appBarIcons.last;
                  searchBar = ListTile(
                    leading: appBarIcons.first,
                    title: TextField(
                      controller: _searchQuery,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                      ),
                    ),
                  );
                } else {
                  appBarIcon = appBarIcons.first;
                  _pokeList = widget.list;
                  searchBar = const Text(
                    'Pokedex 2k23',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  );
                }
              });
            },
            icon: appBarIcon,
          ),
        ],
      ),
      body: _pokeList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 24, right: 24, bottom: 0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: _pokeList.length,
                itemBuilder: (context, index) {
                  return PokemonItem(
                    pokemon: _pokeList.elementAt(index),
                    onTap: widget.onItemTap,
                    index: index,
                  );
                },
              ),
            )
          : const Center(
              child: Text('No pokemons available'),
            ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
