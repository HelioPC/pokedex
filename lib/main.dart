import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/initial_page.dart';

// TODO: replace api for https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/pokedex.json

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex 2k22',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const IntroPage(),
    );
  }
}
