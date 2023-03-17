import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/utils/string.dart';
import 'package:pokedex/common/utils/type_icon.dart';
import 'package:pokedex/features/details/pages/widgets/detail_app_bar.dart';
import 'package:pokedex/features/details/pages/widgets/detail_basic_info.dart';
import 'package:pokedex/features/details/pages/widgets/detail_list.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
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
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailList(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              toCapitalCase(widget.pokemon.name),
                              style: const TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Nº',
                                  style: TextStyle(
                                    color: Color.fromRGBO(75, 75, 75, 1),
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  formatNumber(widget.pokemon.id),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(75, 75, 75, 1),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              width: double.infinity,
                              height: 47,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: widget.pokemon.types
                                    .map(
                                      (t) => Container(
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: getColor(t.type['name'])[0],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                margin: const EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: choose(
                                                  t.type['name'],
                                                  customSize: 25,
                                                  color: getColor(
                                                      t.type['name'])[0],
                                                ),
                                              ),
                                              Text(
                                                toCapitalCase(t.type['name']),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const Divider(),
                            DetailBasicInfo(pokemon: widget.pokemon),
                          ],
                        ),
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
