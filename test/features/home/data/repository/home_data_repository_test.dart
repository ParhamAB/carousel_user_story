import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/features/home/data/repository/home_repository.dart';
import 'package:carousel_user_story/features/home/data/source/home_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carousel_user_story/configs/di.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockIHomeDataSource mock;
  late HomeRepository homeRep;

  setUp(() {
    mock = MockIHomeDataSource();
    homeRep = HomeRepository();

    getIt.registerSingleton<IHomeDataSource>(mock);
  });

  tearDown(() {
    getIt.reset();
  });

  test('items should return dynamic on success', () async {
    final response = {"": ""};

    when(mock.items()).thenAnswer((_) async => response);

    final result = await homeRep.items();
    expect(result, isA<dynamic>());
    verify(mock.items()).called(1);
  });

  test('items should throw an exception on failure', () async {
    when(mock.items()).thenThrow(DataError("error"));
    final result = await homeRep.items();
    expect(result, isA<DataError>());
    verify(mock.items()).called(1);
  });
}
