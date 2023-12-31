import 'package:flutter_aprexi_praxis/model/license.dart';

abstract class LicenseRepository {
  Future<ListLicenseUser> getListLicenseUser(int idUser, String token);
}