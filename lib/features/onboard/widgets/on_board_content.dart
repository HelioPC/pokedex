import 'package:flutter/material.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(description, textAlign: TextAlign.center),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
