import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Counter extends HookWidget {
  Counter({super.key});

  final count = useState(0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => count.value++,
      child: Center(
        child: Text(
          count.value.toString(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
