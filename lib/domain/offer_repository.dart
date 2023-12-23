
import 'package:flutter_aprexi_praxis/model/offer.dart';

abstract class OfferRepository {
  Future<Offer> getOffer(int idOffer, int idUser, String token);
  Future<ListOfferCompany> getListOfferCompany(int idUser, String token);
  Future<ListRequestOffer> getListRequestOffer(int idUser, String token);
  Future<ListFollowOffer> getListFollowOffer(int idUser, String token);
  Future<ListDetailRequestOffer> getListDetailRequestOffer(int idUser, int idOffer, String token);
}
