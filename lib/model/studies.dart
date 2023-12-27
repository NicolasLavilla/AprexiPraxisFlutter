

class ListStudiesUser {
    List<StudiesUser> studiesUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListStudiesUser({
        required this.studiesUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}


class StudiesUser {
  int idStudiesUser;
  int idNameStudies;
  String nameStudies;
  int typeStudies;
  String nameTypeStudies;
  int professionalFamilies;
  String nameFamily;
  int idSchool;
  String nameSchool;
  DateTime startYear;
  DateTime endYear;

  StudiesUser({
    required this.idStudiesUser,
    required this.idNameStudies,
    required this.nameStudies,
    required this.typeStudies,
    required this.nameTypeStudies,
    required this.professionalFamilies,
    required this.nameFamily,
    required this.idSchool,
    required this.nameSchool,
    required this.startYear,
    required this.endYear,
  });
}

