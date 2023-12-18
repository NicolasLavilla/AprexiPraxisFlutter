import 'package:flutter_aprexi_praxis/data/login/remote/login_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/login/remote/mapper/login_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/domain/login_repository.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';

class LoginDataImpl extends LoginRepository {
  final LoginRemoteImpl _remoteImpl;

  LoginDataImpl({required LoginRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<Login> getLogin(String email, String password) async {
    final remoteUser = await _remoteImpl.getUser(email, password);

    return LoginRemoteMapper.fromRemote(remoteUser);
  }
}