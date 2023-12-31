class ListProfessionalProyectsUser {
    List<ProfessionalProyectsUser> professionalProyectsUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListProfessionalProyectsUser({
        required this.professionalProyectsUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}

class ProfessionalProyectsUser {
    int idProfessionalProyects;
    String nameProyect;
    String descriptionProyect;
    String websites;
    dynamic imageProyect;
    String job;
    dynamic briefcase;
    String initDate;
    DateTime endDate;

    ProfessionalProyectsUser({
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
}
