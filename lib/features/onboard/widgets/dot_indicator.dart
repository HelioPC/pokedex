import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 20 : 12,
      width: 4,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF173EA5)
            : const Color(0xFF173EA5).withOpacity(.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
