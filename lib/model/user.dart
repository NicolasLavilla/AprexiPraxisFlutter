class User {
    int idUser;
    String name;
    String surname1;
    String surname2;
    int idGender;
    String nameGender;
    int mobile;
    String email;
    String dni;
    dynamic nie;
    dynamic passport;
    DateTime birthDate;
    String address;
    int idMunicipality;
    int codCountry;
    String nameCountry;
    int codAuto;
    String nameCcaa;
    int idProvince;
    String nameProvince;
    int codMunicipality;
    String nameMunicipality;
    DateTime dateCreation;
    String description;
    int workPermit;
    int autonomousDischarge;
    int ownVehicle;
    String image;
    bool success;
    dynamic idError;
    dynamic messageError;

    User({
        required this.idUser,
        required this.name,
        required this.surname1,
        required this.surname2,
        required this.idGender,
        required this.nameGender,
        required this.mobile,
        required this.email,
        required this.dni,
        required this.nie,
        required this.passport,
        required this.birthDate,
        required this.address,
        required this.idMunicipality,
        required this.codCountry,
        required this.nameCountry,
        required this.codAuto,
        required this.nameCcaa,
        required this.idProvince,
        required this.nameProvince,
        required this.codMunicipality,
        required this.nameMunicipality,
        required this.dateCreation,
        required this.description,
        required this.workPermit,
        required this.autonomousDischarge,
        required this.ownVehicle,
        required this.image,
        required this.success,
        required this.idError,
        required this.messageError,
    });
}
