import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';
import 'package:flutter_aprexi_praxis/data/user/remote/model/user_data_model.dart';

class UserDataRemoteImpl {
  final NetworkClient _networkClient;

  UserDataRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<UserRemoteModel> getUserData(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_USER_DATA,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = UserRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }  
}