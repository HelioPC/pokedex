import 'package:flutter/material.dart';
import 'package:pokedex/common/utils/type_icon.dart';

class DetailHabilityLabel extends StatelessWidget {
  final String name;
  const DetailHabilityLabel({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Material(
        color: getColor(name).first.withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                choose(name),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
