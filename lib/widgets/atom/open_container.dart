import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SampleOpenContainer extends StatelessWidget {
  const SampleOpenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) {
        return const ColoredBox(
          color: Colors.blue,
          child: Center(child: Text('Small Widget')),
        );
      },
      openBuilder: (context, action) {
        return const ColoredBox(
          color: Colors.red,
          child: Center(child: Text('Large Widget')),
        );
      },
    );
  }
}
