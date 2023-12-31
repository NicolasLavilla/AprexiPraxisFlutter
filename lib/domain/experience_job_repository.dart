import 'package:flutter_aprexi_praxis/model/experience_job.dart';

abstract class ExperienceRepository {
  Future<ListExperienceJobUser> getListExperienceJobUser(int idUser, String token);
}