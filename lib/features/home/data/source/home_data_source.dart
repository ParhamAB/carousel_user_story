import 'package:carousel_user_story/configs/di.dart';
import 'package:carousel_user_story/core/utils/extentions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IHomeDataSource {
  Future<dynamic> items();
}

@Injectable(as: IHomeDataSource)
class HomeDataSource implements IHomeDataSource {
  @override
  Future<dynamic> items() async =>
      (await getIt<Dio>().get("home/items")).validate;
}
