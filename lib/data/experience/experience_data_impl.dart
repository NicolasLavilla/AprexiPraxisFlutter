

import 'package:flutter_aprexi_praxis/data/experience/remote/experience_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/experience/remote/mapper/experience_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/domain/experience_job_repository.dart';
import 'package:flutter_aprexi_praxis/model/experience_job.dart';

class ExperienceJobUserDataImpl extends ExperienceRepository {
  final ExperienceJobUserRemoteImpl _remoteImpl;

 ExperienceJobUserDataImpl({required ExperienceJobUserRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<ListExperienceJobUser> getListExperienceJobUser(int idUser, String token) async {
    final remoteListExperienceJobUser = await _remoteImpl.getListExperienceJobUser(idUser, token);

    return ExperienceJobUserRemoteMapper.fromRemoteListExperienceJobUser(remoteListExperienceJobUser);
  }
}