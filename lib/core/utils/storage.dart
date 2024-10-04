import 'package:carousel_user_story/core/utils/is_test_environment.dart';
import 'package:carousel_user_story/main.dart';

class Storage {
  static Future<void> clear() async {
    if (!TestEnvironment.isTestMode()) await MyApp.storage.deleteAll();
  }

  static Future<void> setId(String Id) async {
    if (!TestEnvironment.isTestMode()) {
      await MyApp.storage.write(key: 'Id', value: Id);
    }
  }

  static Future<String?> getId() async {
    if (!TestEnvironment.isTestMode()) {
      return await MyApp.storage.read(key: 'Id');
    }
    return "";
  }
}
