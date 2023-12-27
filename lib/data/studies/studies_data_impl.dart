

import 'package:flutter_aprexi_praxis/data/studies/remote/mapper/studies_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/data/studies/remote/studies_remote_impl.dart';
import 'package:flutter_aprexi_praxis/domain/studies_repository.dart';
import 'package:flutter_aprexi_praxis/model/studies.dart';

class StudiesUserDataImpl extends StudiesRepository {
  final StudiesUserRemoteImpl _remoteImpl;

  StudiesUserDataImpl({required StudiesUserRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<ListStudiesUser> getListStudiesUser(int idUser, String token) async {
    final remoteListStudiesUser = await _remoteImpl.getListStudiesUser(idUser, token);

    return StudiesUserRemoteMapper.fromRemoteListRequestOffer(remoteListStudiesUser);
  }
}