import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/common/routes/routes.dart';
import 'package:pokedex/features/auth/services/auth.dart';
import 'package:pokedex/features/onboard/initial_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => PokemonState()),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          theme: ThemeData(
            canvasColor: Colors.white,
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Pokedex 2k22',
          home: const InitialPage(),
          onGenerateRoute: Routes.onGenerateRoute,
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => const InitialPage(),
          ),
        ),
      ),
    );
  }
}
