class ListLanguagesUserRemoteModel  {
    List<LanguagesUserRemoteModel > languagesUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListLanguagesUserRemoteModel ({
        required this.languagesUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListLanguagesUserRemoteModel .fromMap(Map<String, dynamic> json) => ListLanguagesUserRemoteModel (
        languagesUser: List<LanguagesUserRemoteModel >.from(json["languagesUser"].map((x) => LanguagesUserRemoteModel .fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "languagesUser": List<dynamic>.from(languagesUser.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class LanguagesUserRemoteModel  {
    int idLanguagesUser;
    int idLanguages;
    String nameLanguages;
    int idExperience;
    String nameExperience;

    LanguagesUserRemoteModel ({
        required this.idLanguagesUser,
        required this.idLanguages,
        required this.nameLanguages,
        required this.idExperience,
        required this.nameExperience,
    });

    factory LanguagesUserRemoteModel .fromMap(Map<String, dynamic> json) => LanguagesUserRemoteModel (
        idLanguagesUser: json["idLanguagesUser"],
        idLanguages: json["idLanguages"],
        nameLanguages: json["nameLanguages"],
        idExperience: json["idExperience"],
        nameExperience: json["nameExperience"],
    );

    Map<String, dynamic> toMap() => {
        "idLanguagesUser": idLanguagesUser,
        "idLanguages": idLanguages,
        "nameLanguages": nameLanguages,
        "idExperience": idExperience,
        "nameExperience": nameExperience,
    };
}