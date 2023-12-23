import 'package:flutter_aprexi_praxis/data/offer/remote/model/offer_remote_model.dart';
import 'package:flutter_aprexi_praxis/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_constants.dart';

class OfferRemoteImpl {
  final NetworkClient _networkClient;

  OfferRemoteImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  Future<ListOfferCompanyRemoteModel> getListOfferCompany(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_OFFER_COMPANY,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListOfferCompanyRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }

  Future<OfferRemoteModel> getOfferCompany(
      int idOffer, int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.OFFER_COMPANY,
        queryParameters: {"idOffer": idOffer, "idUser": idUser, "token": token},
      );

      final variable = OfferRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }

  Future<ListRequestOfferRemoteModel> getListRequestOffer(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_REQUEST_OFFER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListRequestOfferRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }

  Future<ListFollowOfferRemoteModel> getListFollowOffer(
      int idUser, String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_FOLLOW_OFFER,
        queryParameters: {"idUser": idUser, "token": token},
      );

      final variable = ListFollowOfferRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }

  Future<ListDetailRequestOfferRemoteModel> getListDetailRequestOffer(
      int idUser, int idOffer ,String token) async {
    try {
      final response = await _networkClient.dio.get(
        NetworkConstants.LIST_DETAIL_REQUEST_OFFER,
        queryParameters: {"idUser": idUser, "idOffer": idOffer, "token": token},
      );

      final variable = ListDetailRequestOfferRemoteModel.fromMap(response.data);
      return variable;
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }
}
