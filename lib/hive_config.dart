import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static star() async {
    Directory dir = await getApplicationSupportDirectory();
    await Hive.initFlutter(dir.path);
  }
}
