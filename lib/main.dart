import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon_repo.dart';
import 'package:pokedex/features/home/container/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex 2k22',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repo: PokemonRepo(dio: Dio()),
      ),
    );
  }
}
