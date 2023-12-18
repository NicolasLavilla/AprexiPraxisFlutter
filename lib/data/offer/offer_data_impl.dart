import 'package:flutter_aprexi_praxis/data/offer/remote/mapper/offer_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/data/offer/remote/offer_remote_impl.dart';
import 'package:flutter_aprexi_praxis/domain/offer_repository.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';

class OfferDataImpl extends OfferRepository {
  final OfferRemoteImpl _remoteImpl;

  OfferDataImpl({required OfferRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<ListOfferCompany> getListOfferCompany(int idUser, String token) async {
    final remoteListOfferCompany = await _remoteImpl.getListOfferCompany(idUser, token);

    return OfferRemoteMapper.fromRemoteListOfferCompany(remoteListOfferCompany);
  }

  @override
  Future<Offer> getOffer(int idOffer, int idUser, String token) async{
    final remoteOfferCompany = await _remoteImpl.getOfferCompany(idOffer ,idUser, token);

    return OfferRemoteMapper.fromRemoteOffer(remoteOfferCompany);
  }
}