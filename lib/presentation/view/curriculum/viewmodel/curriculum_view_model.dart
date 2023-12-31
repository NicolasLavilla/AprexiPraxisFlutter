import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/experience_job_repository.dart';
import 'package:flutter_aprexi_praxis/domain/languages_repository.dart';
import 'package:flutter_aprexi_praxis/domain/license_repository.dart';
import 'package:flutter_aprexi_praxis/domain/professional_proyects_repository.dart';
import 'package:flutter_aprexi_praxis/domain/studies_repository.dart';
import 'package:flutter_aprexi_praxis/domain/user_repository.dart';
import 'package:flutter_aprexi_praxis/model/experience_job.dart';
import 'package:flutter_aprexi_praxis/model/languages.dart';
import 'package:flutter_aprexi_praxis/model/license.dart';
import 'package:flutter_aprexi_praxis/model/professional_families.dart';
import 'package:flutter_aprexi_praxis/model/studies.dart';
import 'package:flutter_aprexi_praxis/model/user.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class CurriculumViewModel extends BaseViewModel {
  final StudiesRepository _studiesRepository;
  final LanguagesRepository _languagesRepository;
  final ExperienceRepository _experienceRepository;
  final LicenseRepository _licenseRepository;
  final ProfessionalProyectsRepository _professionalProyectsRepository;
  final UserRepository _userRepository;

  final StreamController<ResourceState<ListStudiesUser>>
      getListStudiesUserState = StreamController();
  final StreamController<ResourceState<ListLanguagesUser>>
      getListLanguagesUserState = StreamController();
  final StreamController<ResourceState<ListExperienceJobUser>>
      getListExperienceJobUserState = StreamController();
  final StreamController<ResourceState<ListLicenseUser>>
      getListLicenseUserState = StreamController();
  final StreamController<ResourceState<ListProfessionalProyectsUser>>
      getListProfessionalProyectsUserState = StreamController();
  final StreamController<ResourceState<User>>
      getUserDataState = StreamController();

  CurriculumViewModel(
      {required StudiesRepository studiesRepository,
      required LanguagesRepository languagesRepository,
      required ExperienceRepository experienceJobRepository,
      required LicenseRepository licenseRepository,
      required ProfessionalProyectsRepository professionalProyectsRepository,
      required UserRepository userRepository})
      : _studiesRepository = studiesRepository,
        _languagesRepository = languagesRepository,
        _experienceRepository = experienceJobRepository,
        _licenseRepository = licenseRepository,
        _professionalProyectsRepository = professionalProyectsRepository,
        _userRepository = userRepository;

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
        .catchError((error) =>
            getListLanguagesUserState.add(ResourceState.error(error)));
  }

  fetchListExperienceJobUserStateUser(int idUser, String token) {
    getListExperienceJobUserState.add(ResourceState.loading());

    _experienceRepository
        .getListExperienceJobUser(idUser, token)
        .then((value) =>
            getListExperienceJobUserState.add(ResourceState.success(value)))
        .catchError((error) =>
            getListExperienceJobUserState.add(ResourceState.error(error)));
  }

  fetchListLicenseUserStateUser(int idUser, String token) {
    getListLicenseUserState.add(ResourceState.loading());

    _licenseRepository
        .getListLicenseUser(idUser, token)
        .then((value) =>
            getListLicenseUserState.add(ResourceState.success(value)))
        .catchError(
            (error) => getListLicenseUserState.add(ResourceState.error(error)));
  }

  fetchListProfessionalProyectsStateUser(int idUser, String token) {
    getListProfessionalProyectsUserState.add(ResourceState.loading());

    _professionalProyectsRepository
        .getListProfessionalProyectsUser(idUser, token)
        .then((value) => getListProfessionalProyectsUserState
            .add(ResourceState.success(value)))
        .catchError((error) => getListProfessionalProyectsUserState
            .add(ResourceState.error(error)));
  }

  fetchUserDataStateUser(int idUser, String token) {
    getUserDataState.add(ResourceState.loading());

    _userRepository
        .getUserData(idUser, token)
        .then((value) => getUserDataState
            .add(ResourceState.success(value)))
        .catchError((error) => getUserDataState
            .add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getListStudiesUserState.close();
    getListLanguagesUserState.close();
    getListExperienceJobUserState.close();
    getListLicenseUserState.close();
    getListProfessionalProyectsUserState.close();
    getUserDataState.close();
  }
}
