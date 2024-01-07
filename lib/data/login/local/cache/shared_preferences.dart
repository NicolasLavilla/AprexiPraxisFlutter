import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _keyUserId = 'user_id'; // Clave para el ID de usuario
  static const String _keyToken = 'user_token'; // Clave para el token

  static Future<UserData> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt(_keyUserId);
    final String? token = prefs.getString(_keyToken);

    if (userId != null && token != null) {
      return UserData(userId: userId, token: token);
    } else {
      return UserData(userId: null, token: null);
    }
  }

  static Future<void> saveUserData(int userId, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyUserId, userId);
    await prefs.setString(_keyToken, token);
  }

  static Future<void> cleanAllLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyToken);
  }
}
