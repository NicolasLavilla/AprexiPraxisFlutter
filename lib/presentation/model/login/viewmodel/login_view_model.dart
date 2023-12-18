import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/login_repository.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class LoginViewModel extends BaseViewModel{
  final LoginRepository _loginRepository;

  final StreamController<ResourceState<Login>> getLoginUserState = StreamController();
  
  LoginViewModel({required LoginRepository loginRepository}): _loginRepository = loginRepository;

  fetchLoginUser(String email, String password) {
    getLoginUserState.add(ResourceState.loading());

    _loginRepository
        .getLogin(email, password)
        .then((value) => getLoginUserState.add(ResourceState.success(value)))
        .catchError((error) => getLoginUserState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getLoginUserState.close();
  }

}