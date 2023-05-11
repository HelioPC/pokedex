import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/features/home/tabs/home_favorite.dart';
import 'package:pokedex/features/home/tabs/home_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget searchBar = const Text(
    'Pokedex 2k23',
    style: TextStyle(
      fontSize: 24,
    ),
  );

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Pokedex'),
      ),
      body: RefreshIndicator(
          onRefresh: () async {},
          child: Consumer<PokemonState>(
            builder: (context, value, child) {
              return value.list.isEmpty && !value.hasError
                  ? const CircularProgressIndicator()
                  : value.hasError
                      ? Center(
                          child: Text(value.errorMessage),
                        )
                      : IndexedStack(
                          index: _currentIndex,
                          children: const <Widget>[
                            HomeList(),
                            HomeFavorite(),
                          ],
                        );
            },
          )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        selectedItemColor: Colors.black,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {},
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => RotationTransition(
            turns: child.key == const ValueKey('icon1')
                ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                : Tween<double>(begin: 0.75, end: 1).animate(anim),
            child: FadeTransition(opacity: anim, child: child),
          ),
          child: const Icon(
            Icons.search,
            key: ValueKey('icon2'),
          ),
        ),
      ),
    );
  }
}
