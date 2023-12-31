import 'package:flutter_aprexi_praxis/data/professionalFamilies/remote/mapper/professional_families_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/data/professionalFamilies/remote/professional_families_remote_impl.dart';
import 'package:flutter_aprexi_praxis/domain/professional_proyects_repository.dart';
import 'package:flutter_aprexi_praxis/model/professional_families.dart';

class ProfessionalProyectsUserDataImpl extends ProfessionalProyectsRepository {
  final ProfessionalProyectsUserRemoteImpl _remoteImpl;

  ProfessionalProyectsUserDataImpl({required ProfessionalProyectsUserRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<ListProfessionalProyectsUser> getListProfessionalProyectsUser(int idUser, String token) async {
    final remoteListLicenseUser = await _remoteImpl.getListProfessionalProyectsUser(idUser, token);

    return ProfessionalProyectsUserRemoteMapper.fromRemoteListProfessionalProyectsUser(remoteListLicenseUser);
  }
}