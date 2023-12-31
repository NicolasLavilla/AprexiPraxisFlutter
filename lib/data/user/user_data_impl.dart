import 'package:flutter_aprexi_praxis/data/user/remote/mapper/user_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/data/user/remote/user_remote_impl.dart';
import 'package:flutter_aprexi_praxis/domain/user_repository.dart';
import 'package:flutter_aprexi_praxis/model/user.dart';

class UserDataImpl extends UserRepository {
  final UserDataRemoteImpl _remoteImpl;

 UserDataImpl({required UserDataRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<User> getUserData(int idUser, String token) async {
    final remoteUserData = await _remoteImpl.getUserData(idUser, token);

    return UserRemoteMapper.fromUserDataRemote(remoteUserData);
  }
}