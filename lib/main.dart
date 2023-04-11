import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/providers/pokemon_data_provider.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

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
      home: ref.watch(pokemonDataProvider).when(
        data: (data) {
          return HomePage(list: data);
        },
        error: (error, trace) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        },
        loading: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
