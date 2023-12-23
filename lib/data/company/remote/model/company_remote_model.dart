
class CompanyRemoteModel {
    int idCompany;
    DateTime dateCompanyCreation;
    String dateCompanyFundation;
    String nameCompany;
    String nif;
    String address;
    String nameMunicipality;
    int phone;
    String email;
    String websites;
    String description;
    int numWorkers;
    String nameTypeCompany;
    String nameSectorBusiness;
    String logoCompany;
    String imageCompany;
    int followCompany;
    bool success;
    dynamic idError;
    dynamic messageError;

    CompanyRemoteModel({
        required this.idCompany,
        required this.dateCompanyCreation,
        required this.dateCompanyFundation,
        required this.nameCompany,
        required this.nif,
        required this.address,
        required this.nameMunicipality,
        required this.phone,
        required this.email,
        required this.websites,
        required this.description,
        required this.numWorkers,
        required this.nameTypeCompany,
        required this.nameSectorBusiness,
        required this.logoCompany,
        required this.imageCompany,
        required this.followCompany,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory CompanyRemoteModel.fromMap(Map<String, dynamic> json) => CompanyRemoteModel(
        idCompany: json["idCompany"],
        dateCompanyCreation: DateTime.parse(json["dateCompanyCreation"]),
        dateCompanyFundation: json["dateCompanyFundation"],
        nameCompany: json["nameCompany"],
        nif: json["nif"],
        address: json["address"],
        nameMunicipality: json["nameMunicipality"],
        phone: json["phone"],
        email: json["email"],
        websites: json["websites"],
        description: json["description"],
        numWorkers: json["numWorkers"],
        nameTypeCompany: json["nameTypeCompany"],
        nameSectorBusiness: json["nameSectorBusiness"],
        logoCompany: json["logoCompany"],
        imageCompany: json["imageCompany"],
        followCompany: json["followCompany"],
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "idCompany": idCompany,
        "dateCompanyCreation": dateCompanyCreation.toIso8601String(),
        "dateCompanyFundation": dateCompanyFundation,
        "nameCompany": nameCompany,
        "nif": nif,
        "address": address,
        "nameMunicipality": nameMunicipality,
        "phone": phone,
        "email": email,
        "websites": websites,
        "description": description,
        "numWorkers": numWorkers,
        "nameTypeCompany": nameTypeCompany,
        "nameSectorBusiness": nameSectorBusiness,
        "logoCompany": logoCompany,
        "imageCompany": imageCompany,
        "followCompany": followCompany,
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}
