import 'package:commdiary/story_book_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Define a [StateNotifierProvider] to provide a [Counter] instance.
final counterProvider = StateNotifierProvider((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

enum Mode {
  normal,
  storyBook,
}

void main() {
  const mode = Mode.normal;

  switch (mode) {
    case Mode.normal:
      runApp(const ProviderScope(child: CounterApp()));
      break;
    case Mode.storyBook:
      runApp(const SampleStoryBook());
      break;
  }
}

class CounterApp extends HookConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterProvider);
    // isWhiteBackGround is false when Widget built at the first time.
    final isWhiteBackGround = useState(false);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: isWhiteBackGround.value ? Colors.white : Colors.black,
        appBar: AppBar(
          title: const Text('CounterAp'),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => isWhiteBackGround.value = !isWhiteBackGround.value,
          ),
          // backgroundColor:
          //     isWhiteBackGround.value ? Colors.white : Colors.black,
        ),
        body: Center(
          child: Text(
            state.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isWhiteBackGround.value ? Colors.black : Colors.white,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
