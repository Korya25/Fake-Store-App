import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  /// Initialize cache
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Save data
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    if (value is List<String>) return await sharedPreferences.setStringList(key, value);
    throw Exception("Unsupported type");
  }

  /// Get data
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  /// Get string
  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  /// Remove specific key
  static Future<bool> remove({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  /// Clear all data
  static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }

  /// Check if key exists
  static bool containsKey({required String key}) {
    return sharedPreferences.containsKey(key);
  }
}
