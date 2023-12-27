import 'package:flutter_aprexi_praxis/data/languages/remote/languages_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/languages/remote/mapper/languages_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/domain/languages_repository.dart';
import 'package:flutter_aprexi_praxis/model/languages.dart';

class LanguagesDataImpl extends LanguagesRepository {
  final LanguagesUserRemoteImpl _remoteImpl;

 LanguagesDataImpl({required LanguagesUserRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<ListLanguagesUser> getListLanguagesUser(int idUser, String token) async {
    final remoteListStudiesUser = await _remoteImpl.getListLanguagesUser(idUser, token);

    return LanguagesUserRemoteMapper.fromRemoteListRequestOffer(remoteListStudiesUser);
  }
}