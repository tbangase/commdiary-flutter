import 'package:commdiary/widgets/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'atoms/open_container.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'material',
          widgets: [
            WidgetbookComponent(
              name: 'FAB',
              useCases: [
                WidgetbookUseCase(
                  name: 'Icon',
                  builder: (context) {
                    return FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Register Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Register',
                  builder: (context) {
                    return const RegisterButton();
                  },
                ),
              ],
            ),
          ],
        ),
        sampleOpenContainer,
      ],
      appInfo: AppInfo(name: 'Sample Widget from mason'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
    );
  }
}
