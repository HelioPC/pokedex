import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/common/routes/routes.dart';
import 'package:pokedex/initial_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex 2k22',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const InitialPage(),
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
