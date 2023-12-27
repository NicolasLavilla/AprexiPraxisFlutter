import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/languages_repository.dart';
import 'package:flutter_aprexi_praxis/domain/studies_repository.dart';
import 'package:flutter_aprexi_praxis/model/languages.dart';
import 'package:flutter_aprexi_praxis/model/studies.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class CurriculumViewModel extends BaseViewModel {
  final StudiesRepository _studiesRepository;
  final LanguagesRepository _languagesRepository;

  final StreamController<ResourceState<ListStudiesUser>>
      getListStudiesUserState = StreamController();
  final StreamController<ResourceState<ListLanguagesUser>>
      getListLanguagesUserState = StreamController();

  CurriculumViewModel(
      {required StudiesRepository studiesRepository,
      required LanguagesRepository languagesRepository})
      : _studiesRepository = studiesRepository,
      _languagesRepository = languagesRepository;

  fetchListFollowOfferStateUser(int idUser, String token) {
    getListStudiesUserState.add(ResourceState.loading());

    _studiesRepository
        .getListStudiesUser(idUser, token)
        .then((value) =>
            getListStudiesUserState.add(ResourceState.success(value)))
        .catchError(
            (error) => getListStudiesUserState.add(ResourceState.error(error)));
  }

  fetchListLangaugesStateUser(int idUser, String token) {
    getListLanguagesUserState.add(ResourceState.loading());

    _languagesRepository
        .getListLanguagesUser(idUser, token)
        .then((value) =>
            getListLanguagesUserState.add(ResourceState.success(value)))
        .catchError(
            (error) => getListLanguagesUserState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getListStudiesUserState.close();
    getListLanguagesUserState.close();
  }
}
