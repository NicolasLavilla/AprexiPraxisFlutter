class ListOfferCompany {
  List<Offer> offer;
  bool success;
  String idError;
  String messageError;

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
