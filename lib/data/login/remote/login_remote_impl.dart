import 'package:flutter_aprexi_praxis/data/login/remote/model/login_remote_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';


class LoginRemoteImpl {
  final NetworkClient _networkClient;

  LoginRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<LoginRemoteModel> getUser(String email, String password) async {
    try {

      final pass = hashPassword(password);
      final response = await _networkClient.dio.get(
        NetworkConstants.LOGIN_USER,
        queryParameters: {
          "email": email,
          "password": pass},
      );

      final variable = LoginRemoteModel.fromMap(response.data); 
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }


String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);

  var hashedPassword = digest.toString();
  return hashedPassword;
}
}
