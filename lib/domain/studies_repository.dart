import 'package:flutter_aprexi_praxis/model/studies.dart';

abstract class StudiesRepository {
  Future<ListStudiesUser> getListStudiesUser(int idUser, String token);
}