import 'package:flutter_aprexi_praxis/data/company/remote/model/company_remote_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';

class CompanyRemoteImpl {
  final NetworkClient _networkClient;

  CompanyRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<CompanyRemoteModel> getCompany(int idUser, int idCompany,String token) async {
    try {

      final response = await _networkClient.dio.get(
        NetworkConstants.COMPANY,
        queryParameters: {
          "idUser": idUser,
          "idCompany": idCompany,
          "token": token},
      );
 
      final variable = CompanyRemoteModel.fromMap(response.data);
      return variable;
  
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }
}
