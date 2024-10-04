import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:carousel_user_story/features/home/presentation/screens/item_details_screen.dart';

import '../../../../mocked/mocked_data_test.dart';

void main() {
  testWidgets('ItemDetailsScreen renders correctly',
      (WidgetTester tester) async {
    disableOverflowErrors();

    await tester.pumpWidget(MaterialApp(
      home: ItemDetailsScreen(
        model: HomeItemModel(),
      ),
    ));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
}
