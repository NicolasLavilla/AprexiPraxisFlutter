import 'package:flutter_aprexi_praxis/data/license/remote/model/license_data_model.dart';
import 'package:flutter_aprexi_praxis/model/license.dart';

class LicenseUserRemoteMapper {

static ListLicenseUser fromRemoteListLicenseUser(ListLicenseUserRemoteModel remoteModel) {
    return ListLicenseUser(
        licenseUser: fromRemoteLicenseUser(remoteModel.licenseUser),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

static List<LicenseUser> fromRemoteLicenseUser(List<LicenseUserRemoteModel> remoteModels) {
    List<LicenseUser> licenseUser = [];

    for (var remoteModel in remoteModels) {
      licenseUser.add(
        LicenseUser(
          idLicenseUser: remoteModel.idLicenseUser,
          idLicense: remoteModel.idLicense,
          nameLicense: remoteModel.nameLicense
        ),
      );
    }

    return licenseUser;
  }
}