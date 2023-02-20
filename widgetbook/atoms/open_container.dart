import 'package:commdiary/widgets/atoms/open_container.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final sampleOpenContainer = WidgetbookCategory(
  name: 'OpenContainer',
  widgets: [
    WidgetbookComponent(
      name: 'OpenContainer',
      useCases: [
        WidgetbookUseCase(
          name: 'OpenContainer',
          builder: (context) {
            return const Center(
              child: SampleOpenContainer(),
            );
          },
        ),
      ],
    ),
  ],
);
