import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/common/routes/routes.dart';
import 'package:pokedex/common/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PokemonState>().fetchPokemons();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  "lib/assets/images/intro.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Text.rich(
              TextSpan(
                  text: 'Explore the world\nof ',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2F3E77),
                      height: 1.1),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Pokemons',
                      style: TextStyle(color: Color(0xffEA686D)),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Discover all Pokemon species",
              style: TextStyle(color: Color(0xff2F3E77)),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              title: "Start",
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.home);
              },
            )
          ],
        ),
      ),
    );
  }
}
