import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeItemModel Model Test', () {
    test('toJson and fromJson', () {
      final homeitemmodel = HomeItemModel(
          type: "",
          title: "",
          image: "",
          price: "",
          city: "",
          presenter: "",
          runtime: "",
          rate: "",
          url: "",
          id: "");

      homeitemmodel.toJson();
      HomeItemModel.fromJson({"test": "test"});
    });
  });
}
