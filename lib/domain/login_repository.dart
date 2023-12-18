import 'package:flutter_aprexi_praxis/model/login.dart';

abstract class LoginRepository {
  Future<Login> getLogin(String email, String password);
}
