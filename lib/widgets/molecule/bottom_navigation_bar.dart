import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import '../../model/mode.dart';

final logger = Logger();

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar(this.onSelectChanged, {super.key});
  final ValueChanged<int> onSelectChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenModeState = ref.watch(screenModeProvider);

    logger.i(screenModeState);

    return BottomNavigationBar(
      showUnselectedLabels: false,
      currentIndex: screenModeState.index,
      onTap: onSelectChanged,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet),
          label: 'Contexts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lens_blur),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.face_retouching_natural),
          label: 'User',
        ),
      ],
    );
  }
}
