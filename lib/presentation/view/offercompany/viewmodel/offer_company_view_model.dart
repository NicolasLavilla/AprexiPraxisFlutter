import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/offer_repository.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class OfferCompanyViewModel extends BaseViewModel {
  final OfferRepository _offerRepository;

  final StreamController<ResourceState<ListOfferCompany>>
      getListOfferCompanyUserState = StreamController();
      final StreamController<ResourceState<Offer>>
      getOfferCompanyUserState = StreamController();
 

  OfferCompanyViewModel(
      {required OfferRepository offerRepository})
      : _offerRepository = offerRepository;

  fetchListOfferCompanyUser(int idUser, String token) {
    getListOfferCompanyUserState.add(ResourceState.loading());

    _offerRepository
        .getListOfferCompany(idUser, token)
        .then((value) =>
            getListOfferCompanyUserState.add(ResourceState.success(value)))
        .catchError((error) =>
            getListOfferCompanyUserState.add(ResourceState.error(error)));
  }

  fetchOfferCompanyUser(int idOffer, int idUser, String token) {
    getOfferCompanyUserState.add(ResourceState.loading());

    _offerRepository
        .getOffer(idOffer, idUser, token)
        .then((value) =>
            getOfferCompanyUserState.add(ResourceState.success(value)))
        .catchError((error) =>
            getOfferCompanyUserState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getListOfferCompanyUserState.close();
    getOfferCompanyUserState.close();
  }
}
