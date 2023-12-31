import 'package:flutter_aprexi_praxis/model/user.dart';

abstract class UserRepository {
  Future<User> getUserData(int idUser, String token);
}