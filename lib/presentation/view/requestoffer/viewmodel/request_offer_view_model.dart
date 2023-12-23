import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/offer_repository.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class RequestOfferViewModel extends BaseViewModel{
  final OfferRepository _offerRepository;

  final StreamController<ResourceState<ListRequestOffer>> getListRequestOfferState = StreamController();
  final StreamController<ResourceState<ListDetailRequestOffer>> getListDetailRequestOfferState = StreamController();
  
  RequestOfferViewModel({required OfferRepository offerRepository}): _offerRepository = offerRepository;

  fetchListRequestOfferStateUser(int idUser, String token) {
    getListRequestOfferState.add(ResourceState.loading());

    _offerRepository
        .getListRequestOffer(idUser, token)
        .then((value) => getListRequestOfferState.add(ResourceState.success(value)))
        .catchError((error) => getListRequestOfferState.add(ResourceState.error(error)));
  }

  fetchListDetailRequestOfferStateUser(int idUser, int idOffer, String token) {
    getListDetailRequestOfferState.add(ResourceState.loading());

    _offerRepository
        .getListDetailRequestOffer(idUser, idOffer, token)
        .then((value) => getListDetailRequestOfferState.add(ResourceState.success(value)))
        .catchError((error) => getListDetailRequestOfferState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getListRequestOfferState.close();
    getListDetailRequestOfferState.close();
  }
}