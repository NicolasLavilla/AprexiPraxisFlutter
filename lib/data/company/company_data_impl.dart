import 'package:flutter_aprexi_praxis/data/company/remote/company_remote_impl.dart';
import 'package:flutter_aprexi_praxis/data/company/remote/mapper/company_remote_mapper.dart';
import 'package:flutter_aprexi_praxis/domain/company_repository.dart';
import 'package:flutter_aprexi_praxis/model/company.dart';

class CompanyDataImpl extends CompanyRepository {
  final CompanyRemoteImpl _remoteImpl;

  CompanyDataImpl({required CompanyRemoteImpl remoteImpl})
      : _remoteImpl = remoteImpl;

  @override
  Future<Company> getCompany(int idUser, int idCompany, String token) async {
    final remoteCompany = await _remoteImpl.getCompany(idUser, idCompany, token);

    return CompanyRemoteMapper.fromCompanyRemote(remoteCompany);
  }

}