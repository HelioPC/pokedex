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

class _MySearchDelegate extends SearchDelegate<String> {
  final List<Pokemon> _pokeList;
  final List<String> _history;

  _MySearchDelegate(List<Pokemon> list)
      : _pokeList = list,
        _history = [],
        super();

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      onPressed: () => close(context, ''),
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => close(context, query),
              child: Text(
                query,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
        ? _history
        : _pokeList
            .map((e) {
              if (e.name.contains(query)) {
                return e.name;
              } else {
                return '';
              }
            })
            .where((element) => element.contains(query))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, i) {
        final String suggestion = suggestions[i];

        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : null,
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            _history.insert(0, suggestion);
            showResults(context);
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
    ];
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchQuery = TextEditingController();
  late _MySearchDelegate _delegate;

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

  List<Icon> appBarIcons = const [Icon(Icons.search), Icon(Icons.cancel)];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleFavoritePokemon(Pokemon p) {
    setState(
      () => _favorite.contains(p) ? _favorite.remove(p) : _favorite.add(p),
    );
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
                    '${e.id}'
                        .toLowerCase()
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
    _delegate = _MySearchDelegate(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Pokedex'),
        actions: <Widget>[
          if (_searchQuery.text.isEmpty)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                final String? selected = await showSearch(
                  context: context,
                  delegate: _delegate,
                );
                if (selected != null && selected.isNotEmpty) {
                  _searchQuery.text = selected;
                }
                if (mounted && selected != null && selected.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(selected),
                  ));
                }
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => _searchQuery.text = '',
            )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
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
