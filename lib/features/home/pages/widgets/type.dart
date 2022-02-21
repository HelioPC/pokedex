import 'package:flutter/material.dart';

class Types extends StatelessWidget {
  const Types({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}
