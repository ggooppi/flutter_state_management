import 'package:flutter/services.dart';

class Repository {
  static Future<String> loadAssetData() async {
    return await rootBundle.loadString('assets/notifications.json');
  }
}
