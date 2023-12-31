import 'package:flutter_aprexi_praxis/data/professionalFamilies/remote/model/professional_families_data_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';

class ProfessionalProyectsUserRemoteImpl {
  final NetworkClient _networkClient;

  ProfessionalProyectsUserRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<ListProfessionalProyectsUserRemoteModel> getListProfessionalProyectsUser(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_PROFESSIONAL_PROYECTS_USER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListProfessionalProyectsUserRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }  
}