import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  Future<bool> saveUserData(String userData);
  Future<String?> getUserData();
}

class CacheServiceImpl implements CacheService {
  static const _USERDATA = "USER_DATA";

  @override
  Future<bool> saveUserData(String userData) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_USERDATA, userData);
  }

  @override
  Future<String?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_USERDATA);
  }

}
