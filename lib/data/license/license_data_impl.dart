import 'package:flutter_aprexi_praxis/data/license/remote/license_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/license/remote/mapper/license_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/domain/license_repository.dart';
import 'package:flutter_aprexi_praxis/model/license.dart';

class LicenseUserDataImpl extends LicenseRepository {
  final LicenseUserRemoteImpl _remoteImpl;

  LicenseUserDataImpl({required LicenseUserRemoteImpl remoteImpl}): _remoteImpl = remoteImpl;

  @override
  Future<ListLicenseUser> getListLicenseUser(int idUser, String token) async {
    final remoteListLicenseUser = await _remoteImpl.getListLicenseUser(idUser, token);

    return LicenseUserRemoteMapper.fromRemoteListLicenseUser(remoteListLicenseUser);
  }
}