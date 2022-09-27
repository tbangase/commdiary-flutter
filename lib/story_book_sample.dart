import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:commdiary/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<Plugin> _plugins = initializePlugins(
  contentsSidePanel: false,
  knobsSidePanel: false,
  initialDeviceFrameData: DeviceFrameData(
    device: Devices.ios.iPhoneSE,
  ),
);

class SampleStoryBook extends StatelessWidget {
  const SampleStoryBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Screen/Default',
      plugins: _plugins,
      showPanel: true,
      stories: [
        Story(
          name: 'Screens/Default',
          description: 'Story with default flutter app',
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(
                context.knobs.text(
                  label: 'Title',
                  initial: 'AppBarTitle',
                  description: 'The title of the app bar.',
                ),
              ),
              elevation: context.knobs.slider(
                label: 'AppBar elevation',
                initial: 4,
                min: 0,
                max: 10,
                description: 'Elevation of the app bar.',
              ),
              backgroundColor: context.knobs.options(
                label: 'AppBar color',
                initial: Colors.blue,
                description: 'Background color of the app bar.',
                options: const [
                  Option(
                    label: 'Blue',
                    value: Colors.blue,
                  ),
                  Option(
                    label: 'Green',
                    value: Colors.green,
                  ),
                ],
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                children: List.generate(
                  context.knobs.sliderInt(
                    label: 'Items count',
                    initial: 2,
                    min: 1,
                    max: 5,
                    description: 'Number of items in the body container.',
                  ),
                  (_) => const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Hello World!'),
                  ),
                ),
              ),
            ),
            floatingActionButton: context.knobs.boolean(
              label: 'FAB',
              initial: true,
              description: 'Show FAB button',
            )
                ? FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  )
                : null,
          ),
        ),
        Story(
          name: 'Screen/Counter',
          description: 'Demo Counter app with about dialog.',
          builder: (context) => const ProviderScope(child: CounterApp()),
        ),
        Story(
          name: 'Widgets/Text',
          description: 'Simple text widget.',
          builder: (context) => const Center(child: Text('Simple Text')),
        ),
      ],
    );
  }
}
