import 'package:carousel_user_story/main.dart';

class Storage {
  static Future<void> clear() async {
    await MyApp.storage.deleteAll();
  }

  static Future<void> setId(String Id) async {
    await MyApp.storage.write(key: 'Id', value: Id);
  }

  static Future<String?> getId() async {
    return await MyApp.storage.read(key: 'Id');
  }
}
