class ListLicenseUserRemoteModel {
    List<LicenseUserRemoteModel> licenseUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListLicenseUserRemoteModel({
        required this.licenseUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });

    factory ListLicenseUserRemoteModel.fromMap(Map<String, dynamic> json) => ListLicenseUserRemoteModel(
        licenseUser: List<LicenseUserRemoteModel>.from(json["licenseUser"].map((x) => LicenseUserRemoteModel.fromMap(x))),
        success: json["success"],
        idError: json["idError"],
        messageError: json["messageError"],
    );

    Map<String, dynamic> toMap() => {
        "licenseUser": List<dynamic>.from(licenseUser.map((x) => x.toMap())),
        "success": success,
        "idError": idError,
        "messageError": messageError,
    };
}

class LicenseUserRemoteModel {
    int idLicenseUser;
    int idLicense;
    String nameLicense;

    LicenseUserRemoteModel({
        required this.idLicenseUser,
        required this.idLicense,
        required this.nameLicense,
    });

    factory LicenseUserRemoteModel.fromMap(Map<String, dynamic> json) => LicenseUserRemoteModel(
        idLicenseUser: json["idLicenseUser"],
        idLicense: json["idLicense"],
        nameLicense: json["nameLicense"],
    );

    Map<String, dynamic> toMap() => {
        "idLicenseUser": idLicenseUser,
        "idLicense": idLicense,
        "nameLicense": nameLicense,
    };
}
