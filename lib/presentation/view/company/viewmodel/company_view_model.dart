import 'dart:async';

import 'package:flutter_aprexi_praxis/domain/company_repository.dart';
import 'package:flutter_aprexi_praxis/model/company.dart';
import 'package:flutter_aprexi_praxis/presentation/base/base_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';

class CompanyViewModel extends BaseViewModel{
  // ignore: non_constant_identifier_names
  final CompanyRepository _CompanyRepository;

  final StreamController<ResourceState<Company>> getCompanyState = StreamController();
  
  CompanyViewModel({required CompanyRepository companyRepository}): _CompanyRepository = companyRepository;

  fetchCompanyStateUser(int idUser, int idCompany, String token) {
    getCompanyState.add(ResourceState.loading());

    _CompanyRepository
        .getCompany(idUser, idCompany, token)
        .then((value) => getCompanyState.add(ResourceState.success(value)))
        .catchError((error) => getCompanyState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    getCompanyState.close();
  }

}