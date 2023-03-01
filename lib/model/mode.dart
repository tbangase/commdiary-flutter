import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Define a [StateNotifierProvider] to provide a [Mode] instance.
final screenModeProvider =
    StateNotifierProvider<ScreenMode, Mode>((_) => ScreenMode());

class ScreenMode extends StateNotifier<Mode> {
  ScreenMode() : super(Mode.contexts);

  Mode get mode => state;
  set mode(Mode mode) => state = mode;
}

enum Mode {
  contexts,
  feed,
  user,
}
