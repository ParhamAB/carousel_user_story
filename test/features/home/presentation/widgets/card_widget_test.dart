import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:carousel_user_story/features/home/presentation/widgets/card_widget.dart';

import '../../../../mocked/mocked_data_test.dart';

void main() {
  testWidgets('HomeCard renders correctly', (WidgetTester tester) async {
    disableOverflowErrors();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HomeCard(
          model: HomeItemModel(),
        ),
      ),
    ));
  });
}
