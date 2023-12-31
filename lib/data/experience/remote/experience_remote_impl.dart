import 'package:flutter_aprexi_praxis/data/experience/remote/model/experience_data_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';

class ExperienceJobUserRemoteImpl {
  final NetworkClient _networkClient;

  ExperienceJobUserRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<ListExperienceJobUserRemoteModel> getListExperienceJobUser(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_EXPERIENCE_JOB_USER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListExperienceJobUserRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }  
}
