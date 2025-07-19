import 'package:get_storage/get_storage.dart';

abstract class AppStorageString {
  static const String token = 'token';
  static const String isLogin = 'is-login';
  static const String isOnBoardingComplete = 'is-on-boarding-complete';
}

class AppStorage {
  static GetStorage storage = GetStorage();

  static Future<void> write(String key, dynamic value) async {
    await storage.write(key, value);
  }

  static T? read<T>(String key) {
    return storage.read<T>(key);
  }

  static Future<void> setToken(String token) async {
    await storage.write(AppStorageString.token, token);
  }

  static String? get getToken {
    return storage.read<String>(AppStorageString.token);
  }

  static Future<void> setLogin(bool token) async {
    await storage.write(AppStorageString.isLogin, token);
  }

  static bool get getLogin {
    return storage.read<bool>(AppStorageString.isLogin) ?? false;
  }

  static Future<void> setIsOnBoardingComplete(bool value) async {
    await storage.write(AppStorageString.isOnBoardingComplete, value);
  }

  static bool get getIsOnBoardingComplete {
    return storage.read<bool>(AppStorageString.isOnBoardingComplete) ?? false;
  }

  static Future<void> clearStorage() async {
    await storage.remove(AppStorageString.token);
    await storage.remove(AppStorageString.isLogin);
  }
}
