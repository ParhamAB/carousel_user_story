import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/data/repository/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:carousel_user_story/features/home/domain/use_case/home_items_use_case.dart';
import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/configs/di.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockIHomeRepository mockIHomeRepository;
  late HomeItemsUseCase homeitemsusecase;

  setUp(() {
    mockIHomeRepository = MockIHomeRepository();
    homeitemsusecase = HomeItemsUseCase();
    getIt.registerFactory<IHomeRepository>(() => mockIHomeRepository);
  });

  tearDown(() {
    getIt.reset();
  });

  group('HomeItemsUseCase tests', () {
    test('should return DataSuccess when repository call is successful',
        () async {
      final expectedResponse = DataSuccess<List<HomeItemModel>>([]);

      when(mockIHomeRepository.items())
          .thenAnswer((_) async => expectedResponse);

      final result = await homeitemsusecase.call();

      expect(result, isA<DataSuccess>());
      verify(mockIHomeRepository.items()).called(1);
    });

    test('should return DataError when repository call fails', () async {
      final expectedResponse = DataError<List<HomeItemModel>>('Error');

      when(mockIHomeRepository.items())
          .thenAnswer((_) async => expectedResponse);

      final result = await homeitemsusecase.call();

      expect(result, isA<DataError>());
      verify(mockIHomeRepository.items()).called(1);
    });
  });
}
