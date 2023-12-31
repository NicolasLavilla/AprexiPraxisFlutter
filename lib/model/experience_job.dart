
class ListExperienceJobUser {
    List<ExperienceJobUser> experienceJobUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListExperienceJobUser({
        required this.experienceJobUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}

class ExperienceJobUser {
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

    ExperienceJobUser({
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
}
