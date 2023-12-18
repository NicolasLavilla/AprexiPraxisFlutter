import 'package:flutter_aprexi_praxis/presentation/model/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/data/login/login_data_impl.dart';
import 'package:flutter_aprexi_praxis/data/login/remote/login_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/remote/network_client.dart';
import 'package:flutter_aprexi_praxis/domain/login_repository.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

class AppModules {
  setup() {
    _setupMainModule();
    _setupLoginModule();
  }

  _setupMainModule() {
    inject.registerSingleton(NetworkClient());
  }

  _setupLoginModule() {
    inject.registerFactory(() => LoginRemoteImpl(networkClient: inject.get()));
    inject.registerFactory<LoginRepository>(
        () => LoginDataImpl(remoteImpl: inject.get()));
    inject.registerFactory(() => LoginViewModel(loginRepository: inject.get()));
  }
}
