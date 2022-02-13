import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  Future<void> storeLocally(
    SharedPreferences _prefs,
    String json,
    String key,
  ) async {
    await _prefs.setString(key, json);
  }

  bool hasKey(SharedPreferences _prefs, String key) {
    return _prefs.containsKey(key);
  }

  Future<void> setBool(bool val) async {
    final SharedPreferences _prefs = await getSharedPreferencesInstance();
    _prefs.setBool("firstOpen", val);
  }

  Future<bool> getBool() async {
    final SharedPreferences _prefs = await getSharedPreferencesInstance();
    return _prefs.getBool("firstOpen") ?? true;
  }

  String? readFromStorage(SharedPreferences _prefs, String key) {
    return _prefs.getString(key);
  }

  static Future<SharedPreferences> getSharedPreferencesInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<bool> removeKey(SharedPreferences _prefs, String key) async {
    return _prefs.remove(key);
  }
}
