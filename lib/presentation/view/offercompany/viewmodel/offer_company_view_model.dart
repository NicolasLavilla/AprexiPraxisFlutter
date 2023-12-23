import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/offer_repository.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class OfferCompanyViewModel extends BaseViewModel{
  final OfferRepository _offerRepository;

  final StreamController<ResourceState<ListOfferCompany>> getListOfferCompanyUserState = StreamController();
  
  OfferCompanyViewModel({required OfferRepository offerRepository}): _offerRepository = offerRepository;

  fetchListOfferCompanyUser(int idUser, String token) {
    getListOfferCompanyUserState.add(ResourceState.loading());

    _offerRepository
        .getListOfferCompany(idUser, token)
        .then((value) => getListOfferCompanyUserState.add(ResourceState.success(value)))
        .catchError((error) => getListOfferCompanyUserState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getListOfferCompanyUserState.close();
  }

}