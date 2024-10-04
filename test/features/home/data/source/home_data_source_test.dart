import 'package:carousel_user_story/features/home/data/source/home_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:carousel_user_story/configs/di.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockDio mockDio;
  late HomeDataSource homedatasource;

  setUp(() {
    mockDio = MockDio();
    homedatasource = HomeDataSource();

    getIt.registerSingleton<Dio>(mockDio);
  });

  tearDown(() {
    getIt.reset();
  });

  test('items should return dynamic on success', () async {
    final response = Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
      data: {"": ""},
    );

    when(mockDio.get(any)).thenAnswer((_) async => response);

    final result = await homedatasource.items();
    expect(result, isA<dynamic>());
    verify(mockDio.get(any)).called(1);
  });

  test('items should throw an exception on failure', () async {
    when(mockDio.get(any)).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
    ));

    expect(() => homedatasource.items(), throwsA(isA<DioException>()));
  });
}
