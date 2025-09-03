
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHeper {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future saveData(String key, String token) async {
    await storage.write(key: key, value: token);
  }

  Future<String?> getData() async {
    return await storage.read(key: "token");
  }

  Future removeToken() async {
    await storage.delete(key: "token");
  }
}
