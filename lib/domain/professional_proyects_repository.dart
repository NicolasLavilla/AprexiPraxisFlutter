import 'package:flutter_aprexi_praxis/model/professional_families.dart';

abstract class ProfessionalProyectsRepository {
  Future<ListProfessionalProyectsUser> getListProfessionalProyectsUser(int idUser, String token);
}