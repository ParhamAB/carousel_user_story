import 'package:carousel_user_story/features/home/presentation/widgets/key_value_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../../mocked/mocked_data_test.dart';

void main() {
  testWidgets('HomeCard renders correctly', (WidgetTester tester) async {
    disableOverflowErrors();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: KeyValueWidget(
          name: '',
          value: '',
        ),
      ),
    ));
  });

  testWidgets('HomeCard renders correctly with isLink true',
      (WidgetTester tester) async {
    disableOverflowErrors();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: KeyValueWidget(
          name: '',
          value: '',
          isLink: true,
        ),
      ),
    ));
  });
}
