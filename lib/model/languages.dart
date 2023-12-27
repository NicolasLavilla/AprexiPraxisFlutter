
class ListLanguagesUser {
    List<LanguagesUser> languagesUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListLanguagesUser({
        required this.languagesUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}

class LanguagesUser {
    int idLanguagesUser;
    int idLanguages;
    String nameLanguages;
    int idExperience;
    String nameExperience;

    LanguagesUser({
        required this.idLanguagesUser,
        required this.idLanguages,
        required this.nameLanguages,
        required this.idExperience,
        required this.nameExperience,
    });
    }