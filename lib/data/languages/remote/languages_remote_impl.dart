import 'package:flutter_aprexi_praxis/data/languages/remote/model/languages_data_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';

class LanguagesUserRemoteImpl {
  final NetworkClient _networkClient;

  LanguagesUserRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<ListLanguagesUserRemoteModel> getListLanguagesUser(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_LANGUAGES_USER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListLanguagesUserRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }  
}
