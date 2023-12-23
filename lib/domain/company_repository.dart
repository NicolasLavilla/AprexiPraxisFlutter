import 'package:flutter_aprexi_praxis/model/company.dart';

abstract class CompanyRepository {
  Future<Company> getCompany(int idUser, int idCompany, String token);
}
