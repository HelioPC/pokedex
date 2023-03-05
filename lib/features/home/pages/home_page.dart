import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/pages/home_favorite.dart';
import 'package:pokedex/features/home/pages/home_list.dart';
// import 'package:pokedex/features/home/pages/widgets/pokemon_items.dart';

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
  final List<Pokemon> _favorite = [];

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

  List<Icon> appBarIcons = const <Icon>[Icon(Icons.search), Icon(Icons.cancel)];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleFavoritePokemon(Pokemon p) {
    setState(() {
      if (_favorite.contains(p)) {
        _favorite.remove(p);
      } else {
        _favorite.add(p);
      }
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
    final List<Widget> _pages = [
      HomeList(
        pokeList: _pokeList,
        favorites: _favorite,
        onItemTap: widget.onItemTap,
        onDoubleTap: _toggleFavoritePokemon,
        getIndex: (pokemon) => widget.list.indexOf(pokemon),
      ),
      HomeFavorite(
        pokeList: _favorite,
        removeFavorite: _toggleFavoritePokemon,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: searchBar,
        actions: [
          _currentIndex == 0
              ? IconButton(
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
                )
              : const SizedBox(),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
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
