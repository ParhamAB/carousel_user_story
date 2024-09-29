import 'dart:developer';
import 'package:carousel_user_story/configs/di.config.dart';
import 'package:carousel_user_story/core/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.init();
  getIt.registerLazySingleton(() {
    return createApiClient(appBaseUrl);
  });
}

Dio createApiClient(String path) {
  Dio dio = Dio(BaseOptions(
      baseUrl: path,
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60)));
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        log("error: ${e.toString()}\n");
        handler.reject(e);
      },
      onRequest: (request, handler) {
        try {
          log(
            'Request=> ${request.baseUrl}${request.path}'
            '\n'
            'Body=> ${request.data}'
            '\n'
            'Params=> ${request.queryParameters}'
            '\n',
          );
          handler.next(request);
        } catch (e) {
          print(e);
        }
      },
      onResponse: (e, handler) async {
        log(
          'Response=> ${e.realUri} '
          '\n'
          'StatusCode=> ${e.statusCode} '
          '\n'
          'Data=> ${e.data}',
        );
      },
    ),
  );

  return dio;
}
