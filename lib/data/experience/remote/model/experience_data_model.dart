class ListExperienceJobUserRemoteModel {
    List<ExperienceJobUserRemoteModel> experienceJobUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListExperienceJobUserRemoteModel({
        required this.experienceJobUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListExperienceJobUserRemoteModel.fromMap(Map<String, dynamic> json) => ListExperienceJobUserRemoteModel(
        experienceJobUser: List<ExperienceJobUserRemoteModel>.from(json["experienceJobUser"].map((x) => ExperienceJobUserRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "experienceJobUser": List<dynamic>.from(experienceJobUser.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class ExperienceJobUserRemoteModel {
    int idExperienceJobUser;
    String nameJobs;
    int level;
    String nameLevelJob;
    int idCategory;
    String nameCategory;
    String descriptionJob;
    int idCompany;
    String nameCompany;
    DateTime initDate;
    DateTime endDate;

    ExperienceJobUserRemoteModel({
        required this.idExperienceJobUser,
        required this.nameJobs,
        required this.level,
        required this.nameLevelJob,
        required this.idCategory,
        required this.nameCategory,
        required this.descriptionJob,
        required this.idCompany,
        required this.nameCompany,
        required this.initDate,
        required this.endDate,
    });

    factory ExperienceJobUserRemoteModel.fromMap(Map<String, dynamic> json) => ExperienceJobUserRemoteModel(
        idExperienceJobUser: json["idExperienceJobUser"],
        nameJobs: json["nameJobs"],
        level: json["level"],
        nameLevelJob: json["nameLevelJob"],
        idCategory: json["idCategory"],
        nameCategory: json["nameCategory"],
        descriptionJob: json["descriptionJob"],
        idCompany: json["idCompany"],
        nameCompany: json["nameCompany"],
        initDate: DateTime.parse(json["initDate"]),
        endDate: DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toMap() => {
        "idExperienceJobUser": idExperienceJobUser,
        "nameJobs": nameJobs,
        "level": level,
        "nameLevelJob": nameLevelJob,
        "idCategory": idCategory,
        "nameCategory": nameCategory,
        "descriptionJob": descriptionJob,
        "idCompany": idCompany,
        "nameCompany": nameCompany,
        "initDate": "${initDate.year.toString().padLeft(4, '0')}-${initDate.month.toString().padLeft(2, '0')}-${initDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
}
