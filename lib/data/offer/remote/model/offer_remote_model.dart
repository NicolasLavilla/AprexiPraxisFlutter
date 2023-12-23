class ListOfferCompanyRemoteModel {
    List<OfferRemoteModel> offer;
    bool success;
    String? idError;
    String? messageError;

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

class ListRequestOfferRemoteModel {
    List<RequestOfferRemoteModel> requestOffer;
    bool success;
    String? idError;
    String? messageError;

    ListRequestOfferRemoteModel({
        required this.requestOffer,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListRequestOfferRemoteModel.fromMap(Map<String, dynamic> json) => ListRequestOfferRemoteModel(
        requestOffer: List<RequestOfferRemoteModel>.from(json["requestOffer"].map((x) => RequestOfferRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "requestOffer": List<dynamic>.from(requestOffer.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class RequestOfferRemoteModel {
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

    RequestOfferRemoteModel({
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

    factory RequestOfferRemoteModel.fromMap(Map<String, dynamic> json) => RequestOfferRemoteModel(
        idOffer: json["idOffer"],
        idCompany: json["idCompany"],
        nameCompany: json["nameCompany"],
        datePublication: DateTime.parse(json["datePublication"]),
        offerTitle: json["offerTitle"],
        idRequestOffer: json["idRequestOffer"],
        dateRequest: DateTime.parse(json["dateRequest"]),
        stateRequest: json["stateRequest"],
        nameState: json["nameState"],
        numRegistered: json["numRegistered"],
        logoCompany: json["logoCompany"],
    );

    Map<String, dynamic> toMap() => {
        "idOffer": idOffer,
        "idCompany": idCompany,
        "nameCompany": nameCompany,
        "datePublication": datePublication.toIso8601String(),
        "offerTitle": offerTitle,
        "idRequestOffer": idRequestOffer,
        "dateRequest": dateRequest.toIso8601String(),
        "stateRequest": stateRequest,
        "nameState": nameState,
        "numRegistered": numRegistered,
        "logoCompany": logoCompany,
    };
}

class ListFollowOfferRemoteModel {
    List<OfferRemoteModel> offer;
    bool success;
    String? idError;
    String? messageError;

    ListFollowOfferRemoteModel({
        required this.offer,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListFollowOfferRemoteModel.fromMap(Map<String, dynamic> json) => ListFollowOfferRemoteModel(
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

class ListDetailRequestOfferRemoteModel {
    List<DetailRequestOfferRemoteModel> detailRequestOffer;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListDetailRequestOfferRemoteModel({
        required this.detailRequestOffer,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListDetailRequestOfferRemoteModel.fromMap(Map<String, dynamic> json) => ListDetailRequestOfferRemoteModel(
        detailRequestOffer: List<DetailRequestOfferRemoteModel>.from(json["detailRequestOffer"].map((x) => DetailRequestOfferRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "detailRequestOffer": List<dynamic>.from(detailRequestOffer.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class DetailRequestOfferRemoteModel {
    DateTime dateRequest;
    int stateRequest;
    String nameState;
    String descriptionActionRequest;

    DetailRequestOfferRemoteModel({
        required this.dateRequest,
        required this.stateRequest,
        required this.nameState,
        required this.descriptionActionRequest,
    });

    factory DetailRequestOfferRemoteModel.fromMap(Map<String, dynamic> json) => DetailRequestOfferRemoteModel(
        dateRequest: DateTime.parse(json["dateRequest"]),
        stateRequest: json["stateRequest"],
        nameState: json["nameState"],
        descriptionActionRequest: json["descriptionActionRequest"],
    );

    Map<String, dynamic> toMap() => {
        "dateRequest": dateRequest.toIso8601String(),
        "stateRequest": stateRequest,
        "nameState": nameState,
        "descriptionActionRequest": descriptionActionRequest,
    };
}


