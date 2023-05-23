import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  Future<void> saveString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  Future<void> saveDouble(String key, double value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble(key, value);
  }

  Future<String?> loadString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<int?> loadInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  Future<double?> loadDouble(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble(key);
  }

  Future<bool?> loadBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }
}

abstract class SpKey{
  static String menuId = "menu-id";
}

