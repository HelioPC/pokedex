import 'package:custom_navigation_bar/custom_navigation_bar.dart';
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
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Pokedex'),
      ),
      body: Consumer<PokemonState>(
        builder: (context, value, child) {
          return value.list.isEmpty && !value.hasError
              ? const CircularProgressIndicator()
              : value.hasError
                  ? Center(
                      child: Text(value.errorMessage),
                    )
                  : const [
                      HomeList(),
                      HomeFavorite(),
                    ][_currentIndex];
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        backgroundColor: const Color(0xFFEDEDED),
        selectedColor: const Color(0xFF173EA5),
        elevation: 8,
        isFloating: true,
        borderRadius: const Radius.circular(20.0),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: <CustomNavigationBarItem>[
          CustomNavigationBarItem(
            title: const Text('Home'),
            icon: const Icon(
              Icons.catching_pokemon,
            ),
          ),
          CustomNavigationBarItem(
            title: const Text('Favorites'),
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
