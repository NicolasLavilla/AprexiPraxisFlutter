import 'package:flutter_aprexi_praxis/data/login/local/cache/shared_preferences.dart';

class LoginLocalImpl {

  Future<void> saveUserData(int idUser, String token) async {
    await SharedPreferencesHelper.saveUserData(idUser, token);
  }
}
