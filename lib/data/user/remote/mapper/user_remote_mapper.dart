import 'package:flutter_aprexi_praxis/data/user/remote/model/user_data_model.dart';
import 'package:flutter_aprexi_praxis/model/user.dart';

class UserRemoteMapper {
  static User fromUserDataRemote(UserRemoteModel remoteModel) {
    return User(
        idUser: remoteModel.idUser,
        name: remoteModel.name,
        surname1: remoteModel.surname1,
        surname2: remoteModel.surname2,
        idGender: remoteModel.idGender,
        nameGender: remoteModel.nameGender,
        mobile: remoteModel.mobile,
        dni: remoteModel.dni,
        nie: remoteModel.nie,
        passport: remoteModel.passport,
        birthDate: remoteModel.birthDate,
        address: remoteModel.address,
        nameMunicipality: remoteModel.nameMunicipality,
        email: remoteModel.email,
        description: remoteModel.description,
        idMunicipality: remoteModel.idMunicipality,
        codCountry: remoteModel.codCountry,
        nameCountry: remoteModel.nameCountry,
        codAuto: remoteModel.codAuto,
        nameCcaa: remoteModel.nameCcaa,
        idProvince: remoteModel.idProvince,
        nameProvince: remoteModel.nameProvince,
        codMunicipality: remoteModel.codMunicipality,
        dateCreation: remoteModel.dateCreation,
        workPermit: remoteModel.workPermit,
        autonomousDischarge: remoteModel.autonomousDischarge,
        ownVehicle: remoteModel.ownVehicle,
        image: remoteModel.image,
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

  static UserRemoteModel toUserDataRemote(User model) {
    return UserRemoteModel(
        idUser: model.idUser,
        name: model.name,
        surname1: model.surname1,
        surname2: model.surname2,
        idGender: model.idGender,
        nameGender: model.nameGender,
        mobile: model.mobile,
        dni: model.dni,
        nie: model.nie,
        passport: model.passport,
        birthDate: model.birthDate,
        address: model.address,
        nameMunicipality: model.nameMunicipality,
        email: model.email,
        description: model.description,
        idMunicipality: model.idMunicipality,
        codCountry: model.codCountry,
        nameCountry: model.nameCountry,
        codAuto: model.codAuto,
        nameCcaa: model.nameCcaa,
        idProvince: model.idProvince,
        nameProvince: model.nameProvince,
        codMunicipality: model.codMunicipality,
        dateCreation: model.dateCreation,
        workPermit: model.workPermit,
        autonomousDischarge: model.autonomousDischarge,
        ownVehicle: model.ownVehicle,
        image: model.image,
        success: model.success,
        idError: model.idError,
        messageError: model.messageError);
  }
}
