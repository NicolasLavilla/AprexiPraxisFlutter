import 'package:flutter_aprexi_praxis/data/license/remote/model/license_data_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';

class LicenseUserRemoteImpl {
  final NetworkClient _networkClient;

  LicenseUserRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<ListLicenseUserRemoteModel> getListLicenseUser(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_LICENSE_USER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListLicenseUserRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }  
}