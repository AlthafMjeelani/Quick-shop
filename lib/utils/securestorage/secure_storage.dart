import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const storage = FlutterSecureStorage();
  static const keyName = 'token';

  static Future<void> setToken(String token) async {
    await storage.write(key: keyName, value: token);
  }

  static Future<String?> getToken() async {
    await storage.read(key: keyName);
    return null;
  }
}
