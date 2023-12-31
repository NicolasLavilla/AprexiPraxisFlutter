class ListLicenseUser {
    List<LicenseUser> licenseUser;
    bool success;
    dynamic idError;
    dynamic messageError;

    ListLicenseUser({
        required this.licenseUser,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}

class LicenseUser {
    int idLicenseUser;
    int idLicense;
    String nameLicense;

    LicenseUser({
        required this.idLicenseUser,
        required this.idLicense,
        required this.nameLicense,
    });
}
