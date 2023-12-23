import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/offer_repository.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class FollowOfferViewModel extends BaseViewModel{
  final OfferRepository _offerRepository;

  final StreamController<ResourceState<ListFollowOffer>> getListFollowOfferState = StreamController();
  
  FollowOfferViewModel({required OfferRepository offerRepository}): _offerRepository = offerRepository;

  fetchListFollowOfferStateUser(int idUser, String token) {
    getListFollowOfferState.add(ResourceState.loading());

    _offerRepository
        .getListFollowOffer(idUser, token)
        .then((value) => getListFollowOfferState.add(ResourceState.success(value)))
        .catchError((error) => getListFollowOfferState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getListFollowOfferState.close();
  }

}