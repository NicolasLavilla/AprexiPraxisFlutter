import 'package:flutter_aprexi_praxis/data/login/remote/model/login_remote_model.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';

class LoginRemoteMapper {
  static Login fromRemote(LoginRemoteModel remoteModel) {
    return Login(
        success: remoteModel.success,
        idUser: remoteModel.idUser,
        token: remoteModel.token);
  }

  static LoginRemoteModel toRemote(Login model) {
    return LoginRemoteModel(
         success: model.success,
        idUser: model.idUser,
        token: model.token);
  }
}

class CheckTokenRemoteMapper {
  static CheckToken fromRemote(CheckTokenRemoteModel remoteModel) {
    return CheckToken(
        checkToken: remoteModel.checkToken,
        message: remoteModel.message);
  }

  static CheckTokenRemoteModel toRemote(CheckToken model) {
    return CheckTokenRemoteModel(
         checkToken: model.checkToken,
        message: model.message);
  }
}
