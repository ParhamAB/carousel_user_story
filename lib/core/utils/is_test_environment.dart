import 'dart:io';

import 'package:flutter/foundation.dart';

class TestEnvironment {
  static bool isTestMode() {
    if (kIsWeb) {
      return false;
    } else {
      return Platform.environment.containsKey('FLUTTER_TEST');
    }
  }
}
