import 'package:flutter_aprexi_praxis/model/languages.dart';

abstract class LanguagesRepository {
  Future<ListLanguagesUser> getListLanguagesUser(int idUser, String token);
}