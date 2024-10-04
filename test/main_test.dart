import 'package:carousel_user_story/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'mocked/mocked_data_test.dart';

void main() {
  testWidgets('SplashScreen renders correctly', (WidgetTester tester) async {
    disableOverflowErrors();

    await tester.pumpWidget(const MaterialApp(
      home: MyApp(),
    ));

    await tester.pump(const Duration(seconds: 10));
  });
}
