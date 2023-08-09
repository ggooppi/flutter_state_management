import 'package:path_provider/path_provider.dart';

class Util {
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
