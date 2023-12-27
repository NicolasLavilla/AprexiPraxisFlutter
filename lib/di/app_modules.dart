import 'package:flutter_aprexi_praxis/data/company/company_data_impl.dart';
import 'package:flutter_aprexi_praxis/data/company/remote/company_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/languages/languages_data_impl.dart';
import 'package:flutter_aprexi_praxis/data/languages/remote/languages_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/login/local/cache/shared_preferences.dart';
import 'package:flutter_aprexi_praxis/data/login/local/login_local_impl.dart';
import 'package:flutter_aprexi_praxis/data/offer/offer_data_impl.dart';
import 'package:flutter_aprexi_praxis/data/offer/remote/offer_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/studies/remote/studies_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/studies/studies_data_impl.dart';
import 'package:flutter_aprexi_praxis/domain/company_repository.dart';
import 'package:flutter_aprexi_praxis/domain/languages_repository.dart';
import 'package:flutter_aprexi_praxis/domain/offer_repository.dart';
import 'package:flutter_aprexi_praxis/domain/studies_repository.dart';
import 'package:flutter_aprexi_praxis/presentation/view/company/viewmodel/company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/viewmodel/curriculum_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/followoffer/viewmodel/follow_offer_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/data/login/login_data_impl.dart';
import 'package:flutter_aprexi_praxis/data/login/remote/login_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/domain/login_repository.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/viewmodel/offer_company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/viewmodel/request_offer_view_model.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

class AppModules {
  setup() {
    _setupMainModule();
    _setupLoginModule();
    _setupOffersModule();
    _setupCompanyModule();
    _setupStudiesUserModule();
    _setupLanguagesUserModule();
    _setupCurriculumUserModule();
  }

  _setupMainModule() {
    inject.registerSingleton(NetworkClient());
  }

  _setupLoginModule() {
    inject.registerFactory(() => LoginRemoteImpl(networkClient: inject.get()));
    inject.registerFactory(() => SharedPreferencesHelper());
    inject.registerFactory(() => LoginLocalImpl());
    inject.registerFactory<LoginRepository>(() => LoginDataImpl(remoteImpl: inject.get(), localImpl: inject.get()));
    inject.registerFactory(() => LoginViewModel(loginRepository: inject.get()));
  }

  _setupCompanyModule() {
    inject.registerFactory(() => CompanyRemoteImpl(networkClient: inject.get()));
    inject.registerFactory<CompanyRepository>(() => CompanyDataImpl(remoteImpl: inject.get()));
    inject.registerFactory(() => CompanyViewModel(companyRepository: inject.get()));
  }

  _setupStudiesUserModule() {
    inject.registerFactory(() => StudiesUserRemoteImpl(networkClient: inject.get()));
    inject.registerFactory<StudiesRepository>(() => StudiesUserDataImpl(remoteImpl: inject.get()));
  }

   _setupLanguagesUserModule() {
    inject.registerFactory(() => LanguagesUserRemoteImpl(networkClient: inject.get()));
    inject.registerFactory<LanguagesRepository>(() => LanguagesDataImpl(remoteImpl: inject.get()));
  }

  _setupCurriculumUserModule() {
    inject.registerFactory(() => CurriculumViewModel(studiesRepository: inject.get(), languagesRepository: inject.get()));
  }

  _setupOffersModule() {
    inject.registerFactory(() => OfferRemoteImpl(networkClient: inject.get()));
    inject.registerFactory<OfferRepository>(() => OfferDataImpl(remoteImpl: inject.get()));
    inject.registerFactory(() => OfferCompanyViewModel(offerRepository: inject.get()));
    inject.registerFactory(() => RequestOfferViewModel(offerRepository: inject.get()));
    inject.registerFactory(() => FollowOfferViewModel(offerRepository: inject.get()));
  }
}
