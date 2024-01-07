import 'package:flutter_aprexi_praxis/data/login/local/cache/shared_preferences.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';

class LoginLocalImpl {

  Future<void> saveUserData(int idUser, String token) async {
    await SharedPreferencesHelper.saveUserData(idUser, token);
  }

  Future<UserData> getUserDataCache() async {
    return await SharedPreferencesHelper.getUserData();
  }

  Future<void> cleanAllLogin() async {
    return await SharedPreferencesHelper.cleanAllLogin();
  }
}
