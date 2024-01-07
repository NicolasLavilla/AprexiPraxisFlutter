import 'package:flutter_aprexi_praxis/data/login/local/login_local_impl.dart';
import 'package:flutter_aprexi_praxis/data/login/remote/login_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/login/remote/mapper/login_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/domain/login_repository.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';

class LoginDataImpl extends LoginRepository {
  final LoginRemoteImpl _remoteImpl;
  final LoginLocalImpl _localImpl;

  LoginDataImpl({required LoginRemoteImpl remoteImpl, required LoginLocalImpl localImpl})
      : _remoteImpl = remoteImpl,
        _localImpl = localImpl; 

  @override
  Future<Login> getLogin(String email, String password) async {
    final remoteUser = await _remoteImpl.getUser(email, password);

    if(remoteUser.success == true && remoteUser.idUser != 0 && remoteUser.token != ""){
      saveLogin(remoteUser.idUser, remoteUser.token);
    }else{

    }
    
    return LoginRemoteMapper.fromRemote(remoteUser);
  }

  saveLogin(int idUser, String token) async {
    await _localImpl.saveUserData(idUser, token);
  }

  cleanAllLogin() async {
    await _localImpl.cleanAllLogin();
  }
  
  @override
  Future<CheckToken> getCheckToken(String token) async {
    final checkToken = await _remoteImpl.getCheckToken(token);

    if(checkToken.checkToken){

    }else{
      cleanAllLogin();
    }

    return CheckTokenRemoteMapper.fromRemote(checkToken);
  }
  
  @override
  Future<UserData> getUserDataCache() {
    return _localImpl.getUserDataCache();
  }
}