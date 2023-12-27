import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';
import 'package:flutter_aprexi_praxis/data/studies/remote/model/studies_data_model.dart';

class StudiesUserRemoteImpl {
  final NetworkClient _networkClient;

  StudiesUserRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<ListStudiesUserRemoteModel> getListStudiesUser(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_STUDIES_USER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListStudiesUserRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }  
}
