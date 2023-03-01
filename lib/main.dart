import 'package:commdiary/widgets/molecule/bottom_navigation_bar.dart';
import 'package:commdiary/widgets/molecule/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/mode.dart';

void main() {
  runApp(const ProviderScope(child: CounterApp()));
}

class CounterApp extends HookConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState(true);

    void onSelectChanged(int index) {
      ref.read(screenModeProvider.notifier).mode = Mode.values[index];
    }

    return MaterialApp(
      theme: isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Counter(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => isDarkMode.value = !isDarkMode.value,
          tooltip: 'Increment',
          child: const Icon(Icons.settings),
        ),
        bottomNavigationBar: BottomNavBar(onSelectChanged),
      ),
    );
  }
}
