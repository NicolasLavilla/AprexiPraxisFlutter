import 'package:flutter_aprexi_praxis/data/company/remote/model/company_remote_model.dart';
import 'package:flutter_aprexi_praxis/model/company.dart';

class CompanyRemoteMapper {
  static Company fromCompanyRemote(CompanyRemoteModel remoteModel) {
    return Company(
        idCompany: remoteModel.idCompany,
        dateCompanyCreation: remoteModel.dateCompanyCreation,
        dateCompanyFundation: remoteModel.dateCompanyFundation,
        nameCompany: remoteModel.nameCompany,
        nif: remoteModel.nif,
        address: remoteModel.address,
        nameMunicipality: remoteModel.nameMunicipality,
        phone: remoteModel.phone,
        email: remoteModel.email,
        websites: remoteModel.websites,
        description: remoteModel.description,
        numWorkers: remoteModel.numWorkers,
        nameTypeCompany: remoteModel.nameTypeCompany,
        nameSectorBusiness: remoteModel.nameSectorBusiness,
        logoCompany: remoteModel.logoCompany,
        imageCompany: remoteModel.imageCompany,
        followCompany: remoteModel.followCompany,
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

  static CompanyRemoteModel toCompanyRemote(Company model) {
    return CompanyRemoteModel(
        idCompany: model.idCompany,
        dateCompanyCreation: model.dateCompanyCreation,
        dateCompanyFundation: model.dateCompanyFundation,
        nameCompany: model.nameCompany,
        nif: model.nif,
        address: model.address,
        nameMunicipality: model.nameMunicipality,
        phone: model.phone,
        email: model.email,
        websites: model.websites,
        description: model.description,
        numWorkers: model.numWorkers,
        nameTypeCompany: model.nameTypeCompany,
        nameSectorBusiness: model.nameSectorBusiness,
        logoCompany: model.logoCompany,
        imageCompany: model.imageCompany,
        followCompany: model.followCompany,
        success: model.success,
        idError: model.idError,
        messageError: model.messageError);
  }
}
