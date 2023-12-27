class ListStudiesUserRemoteModel {
    List<StudiesUserRemoteModel> studiesUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListStudiesUserRemoteModel({
        required this.studiesUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListStudiesUserRemoteModel.fromMap(Map<String, dynamic> json) => ListStudiesUserRemoteModel(
        studiesUser: List<StudiesUserRemoteModel>.from(json["studiesUser"].map((x) => StudiesUserRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "studiesUser": List<dynamic>.from(studiesUser.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class StudiesUserRemoteModel {
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

    StudiesUserRemoteModel({
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

    factory StudiesUserRemoteModel.fromMap(Map<String, dynamic> json) => StudiesUserRemoteModel(
        idStudiesUser: json["idStudiesUser"],
        idNameStudies: json["idNameStudies"],
        nameStudies: json["nameStudies"],
        typeStudies: json["typeStudies"],
        nameTypeStudies: json["nameTypeStudies"],
        professionalFamilies: json["professionalFamilies"],
        nameFamily: json["nameFamily"],
        idSchool: json["idSchool"],
        nameSchool: json["nameSchool"],
        startYear: DateTime.parse(json["startYear"]),
        endYear: DateTime.parse(json["endYear"]),
    );

    Map<String, dynamic> toMap() => {
        "idStudiesUser": idStudiesUser,
        "idNameStudies": idNameStudies,
        "nameStudies": nameStudies,
        "typeStudies": typeStudies,
        "nameTypeStudies": nameTypeStudies,
        "professionalFamilies": professionalFamilies,
        "nameFamily": nameFamily,
        "idSchool": idSchool,
        "nameSchool": nameSchool,
        "startYear": "${startYear.year.toString().padLeft(4, '0')}-${startYear.month.toString().padLeft(2, '0')}-${startYear.day.toString().padLeft(2, '0')}",
        "endYear": "${endYear.year.toString().padLeft(4, '0')}-${endYear.month.toString().padLeft(2, '0')}-${endYear.day.toString().padLeft(2, '0')}",
    };
}
