class ListOfferCompanyRemoteModel {
    List<OfferRemoteModel> offer;
    bool success;
    String idError;
    String messageError;

    ListOfferCompanyRemoteModel({
        required this.offer,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListOfferCompanyRemoteModel.fromMap(Map<String, dynamic> json) => ListOfferCompanyRemoteModel(
        offer: List<OfferRemoteModel>.from(json["offer"].map((x) => OfferRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "offer": List<dynamic>.from(offer.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class OfferRemoteModel {
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

    OfferRemoteModel({
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

    factory OfferRemoteModel.fromMap(Map<String, dynamic> json) => OfferRemoteModel(
        idOffer: json["idOffer"],
        idCompany: json["idCompany"],
        nameCompany: json["nameCompany"],
        nameModality: json["nameModality"],
        datePublication: DateTime.parse(json["datePublication"]),
        nameWorking: json["nameWorking"],
        nameContract: json["nameContract"],
        numVacancies: json["numVacancies"],
        nameTypeStudies: json["nameTypeStudies"],
        nameStudies: json["nameStudies"],
        nameSkills: json["nameSkills"],
        minRequirements: json["minRequirements"],
        jobDescription: json["jobDescription"],
        numRegistered: json["numRegistered"],
        nameMunicipality: json["nameMunicipality"],
        salary: json["salary"],
        offerTitle: json["offerTitle"],
        logoCompany: json["logoCompany"],
        imageCompany: json["imageCompany"],
        combinedLanguages: json["combinedLanguages"],
        combinedLicenses: json["combinedLicenses"],
        minExperience: json["minExperience"],
        followCompany: json["followCompany"],
        followOffer: json["followOffer"],
        requestOffer: json["requestOffer"],
    );

    Map<String, dynamic> toMap() => {
        "idOffer": idOffer,
        "idCompany": idCompany,
        "nameCompany": nameCompany,
        "nameModality": nameModality,
        "datePublication": datePublication.toIso8601String(),
        "nameWorking": nameWorking,
        "nameContract": nameContract,
        "numVacancies": numVacancies,
        "nameTypeStudies": nameTypeStudies,
        "nameStudies": nameStudies,
        "nameSkills": nameSkills,
        "minRequirements": minRequirements,
        "jobDescription": jobDescription,
        "numRegistered": numRegistered,
        "nameMunicipality": nameMunicipality,
        "salary": salary,
        "offerTitle": offerTitle,
        "logoCompany": logoCompany,
        "imageCompany": imageCompany,
        "combinedLanguages": combinedLanguages,
        "combinedLicenses": combinedLicenses,
        "minExperience": minExperience,
        "followCompany": followCompany,
        "followOffer": followOffer,
        "requestOffer": requestOffer,
    };
}
