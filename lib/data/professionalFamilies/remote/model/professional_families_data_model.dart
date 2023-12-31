class ListProfessionalProyectsUserRemoteModel {
    List<ProfessionalProyectsUserRemoteModel> professionalProyectsUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListProfessionalProyectsUserRemoteModel({
        required this.professionalProyectsUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListProfessionalProyectsUserRemoteModel.fromMap(Map<String, dynamic> json) => ListProfessionalProyectsUserRemoteModel(
        professionalProyectsUser: List<ProfessionalProyectsUserRemoteModel>.from(json["professionalProyectsUser"].map((x) => ProfessionalProyectsUserRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "professionalProyectsUser": List<dynamic>.from(professionalProyectsUser.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class ProfessionalProyectsUserRemoteModel {
    int idProfessionalProyects;
    String nameProyect;
    String descriptionProyect;
    String websites;
    dynamic imageProyect;
    String job;
    dynamic briefcase;
    String initDate;
    DateTime endDate;

    ProfessionalProyectsUserRemoteModel({
        required this.idProfessionalProyects,
        required this.nameProyect,
        required this.descriptionProyect,
        required this.websites,
        required this.imageProyect,
        required this.job,
        required this.briefcase,
        required this.initDate,
        required this.endDate,
    });

    factory ProfessionalProyectsUserRemoteModel.fromMap(Map<String, dynamic> json) => ProfessionalProyectsUserRemoteModel(
        idProfessionalProyects: json["idProfessionalProyects"],
        nameProyect: json["nameProyect"],
        descriptionProyect: json["descriptionProyect"],
        websites: json["websites"],
        imageProyect: json["imageProyect"],
        job: json["job"],
        briefcase: json["briefcase"],
        initDate: json["initDate"],
        endDate: DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toMap() => {
        "idProfessionalProyects": idProfessionalProyects,
        "nameProyect": nameProyect,
        "descriptionProyect": descriptionProyect,
        "websites": websites,
        "imageProyect": imageProyect,
        "job": job,
        "briefcase": briefcase,
        "initDate": initDate,
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
}
