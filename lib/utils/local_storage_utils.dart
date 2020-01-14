import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const KEY_USER_TOKEN = 'user_token';
}

Future<String> getUserTokenFromLocalStorage() async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  String token = await storage.read(key: LocalStorage.KEY_USER_TOKEN);
  return token;
}