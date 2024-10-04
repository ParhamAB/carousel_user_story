import 'package:carousel_user_story/configs/di.dart';
import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/data/repository/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:carousel_user_story/features/home/presentation/screens/home_items_screen.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockIHomeRepository mockIHomeRepository;

  setUp(() {
    mockIHomeRepository = MockIHomeRepository();
    getIt.registerFactory<IHomeRepository>(() => mockIHomeRepository);
  });

  tearDown(() {
    getIt.reset();
  });

  testWidgets('HomeItemsScreen renders correctly', (WidgetTester tester) async {
    when(mockIHomeRepository.items()).thenAnswer((_) async => DataSuccess([
          HomeItemModel(
              city: "",
              id: "",
              image: "",
              presenter: "",
              price: "",
              rate: "",
              runtime: "",
              title: "",
              type: "",
              url: "")
        ]));

    await tester.pumpWidget(const MaterialApp(
      home: HomeItemsScreen(),
    ));
  });
}
