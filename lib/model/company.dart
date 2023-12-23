
class Company {
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

    Company({
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
}
