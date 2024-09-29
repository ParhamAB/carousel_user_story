import 'dart:convert';

// import 'package:carousel_user_story/configs/di.dart';
// import 'package:carousel_user_story/core/utils/extentions.dart';
// import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

abstract class IHomeDataSource {
  Future<dynamic> items();
}

@Injectable(as: IHomeDataSource)
class HomeDataSource implements IHomeDataSource {
  @override
  Future<dynamic> items() async {
    try {
      final res = await http.get(Uri.parse(
          'https://66e20997c831c8811b57050e.mockapi.io/api/v1/home/items'));
      // return (await getIt<Dio>().get("home/items")).validate;
      final temp = jsonDecode(res.body);
      return temp;
    } catch (e) {
      print(e);
    }
  }
}
