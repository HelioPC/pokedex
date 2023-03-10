import 'package:flutter/material.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key, required this.list}) : super(key: key);

  final List<dynamic> list;

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Olá',
        ),
      ),
    );
  }
}
