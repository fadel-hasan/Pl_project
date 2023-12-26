import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _loginTokenKey = 'loginToken';
  static const String _registrationTokenKey = 'registrationToken';

  static Future<void> saveRegisterToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_registrationTokenKey, token);
  }

  static Future<String?> getRegisterToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_registrationTokenKey);
  }

  static Future<void> deleteRegisterToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_registrationTokenKey);
  }

  static Future<void> saveLoginToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_loginTokenKey, token);
  }

  static Future<String?> getLoginToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_loginTokenKey);
  }

  static Future<void> deleteLoginToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loginTokenKey);
  }

  // Similar methods for registration token
}
