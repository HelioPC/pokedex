import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/pokemon_state.dart';
import 'package:pokedex/features/details/widgets/detail_app_bar.dart';
import 'package:pokedex/features/details/widgets/detail_header.dart';
import 'package:pokedex/features/details/widgets/detail_list.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  bool isOnTop = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonState>(context, listen: true);
    final list = provider.list;
    final pokemon = provider.currentPokemon;

    PageController controller = PageController(
      viewportFraction: .6,
      initialPage: provider.getPokemonIndex(pokemon),
    );

    return Scaffold(
      body: NotificationListener(
        onNotification: ((notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 37) {
              isOnTop = true;
            }
          });
          return false;
        }),
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBar(
              pokemon: pokemon,
              onBack: () => Navigator.of(context).pop(),
              isOnTop: isOnTop,
            ),
            DetailList(
              pokemon: pokemon,
              list: list,
              controller: controller,
              onChangePokemon: (Pokemon pokemon) {
                setState(() {
                  provider.setCurrentPokemon(pokemon);
                });
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: DetailHeader(pokemon: pokemon),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
