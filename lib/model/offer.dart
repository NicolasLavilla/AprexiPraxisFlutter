class ListOfferCompany {
  List<Offer> offer;
  bool success;
  String? idError;
  String? messageError;

  ListOfferCompany({
    required this.offer,
    required this.success,
    required this.idError,
    required this.messageError,
  });
}

class Offer {
  int idOffer;
  int idCompany;
  String nameCompany;
  String nameModality;
  DateTime datePublication;
  String nameWorking;
  String nameContract;
  int numVacancies;
  String nameTypeStudies;
  String nameStudies;
  String nameSkills;
  String minRequirements;
  String jobDescription;
  int numRegistered;
  String nameMunicipality;
  int salary;
  String offerTitle;
  String logoCompany;
  String? imageCompany;
  String combinedLanguages;
  String? combinedLicenses;
  int? minExperience;
  int followCompany;
  int followOffer;
  int requestOffer;

  Offer({
    required this.idOffer,
    required this.idCompany,
    required this.nameCompany,
    required this.nameModality,
    required this.datePublication,
    required this.nameWorking,
    required this.nameContract,
    required this.numVacancies,
    required this.nameTypeStudies,
    required this.nameStudies,
    required this.nameSkills,
    required this.minRequirements,
    required this.jobDescription,
    required this.numRegistered,
    required this.nameMunicipality,
    required this.salary,
    required this.offerTitle,
    required this.logoCompany,
    required this.imageCompany,
    required this.combinedLanguages,
    required this.combinedLicenses,
    required this.minExperience,
    required this.followCompany,
    required this.followOffer,
    required this.requestOffer,
  });
}

class ListRequestOffer {
    List<RequestOffer> requestOffer;
    bool success;
    String? idError;
    String? messageError;

    ListRequestOffer({
        required this.requestOffer,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}

class RequestOffer {
    int idOffer;
    int idCompany;
    String nameCompany;
    DateTime datePublication;
    String offerTitle;
    int idRequestOffer;
    DateTime dateRequest;
    int stateRequest;
    String nameState;
    int numRegistered;
    String logoCompany;

    RequestOffer({
        required this.idOffer,
        required this.idCompany,
        required this.nameCompany,
        required this.datePublication,
        required this.offerTitle,
        required this.idRequestOffer,
        required this.dateRequest,
        required this.stateRequest,
        required this.nameState,
        required this.numRegistered,
        required this.logoCompany,
    });
}

class ListFollowOffer {
    List<Offer> offer;
    bool success;
    String? idError;
    String? messageError;

    ListFollowOffer({
        required this.offer,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}


class ListDetailRequestOffer {
    List<DetailRequestOffer> detailRequestOffer;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListDetailRequestOffer({
        required this.detailRequestOffer,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}

class DetailRequestOffer {
    DateTime dateRequest;
    int stateRequest;
    String nameState;
    String descriptionActionRequest;

    DetailRequestOffer({
        required this.dateRequest,
        required this.stateRequest,
        required this.nameState,
        required this.descriptionActionRequest,
    });
}
