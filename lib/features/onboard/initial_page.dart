import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/common/routes/routes.dart';
import 'package:pokedex/features/onboard/widgets/dot_indicator.dart';
import 'package:pokedex/features/onboard/widgets/on_board_content.dart';
import 'package:provider/provider.dart';

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<OnBoard> onBoardDataContent = [
    OnBoard(
      image: 'lib/assets/images/charizard.png',
      title: 'Todos Pokémons em um só lugar',
      description:
          'Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo',
    ),
    OnBoard(
      image: 'lib/assets/images/ball.png',
      title: 'Mantenha sua Pokédex atualizada',
      description:
          'Cadastre-se e mantenha seu perfil, pokémons fvoritos, configurações e muito mais, salvos no aplicativo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    context.read<PokemonState>().fetchPokemons();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                itemCount: onBoardDataContent.length,
                itemBuilder: (context, index) {
                  return OnBoardContent(
                    image: onBoardDataContent[index].image,
                    title: onBoardDataContent[index].title,
                    description: onBoardDataContent[index].description,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  ...List.generate(
                    onBoardDataContent.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: _pageIndex != onBoardDataContent.length - 1,
                    replacement: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.authOrHome);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF173EA5),
                        ),
                        child: const Text(
                          'Vamos começar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          backgroundColor: const Color(0xFF173EA5),
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
