
import 'package:flutter_aprexi_praxis/data/professionalFamilies/remote/model/professional_families_data_model.dart';
import 'package:flutter_aprexi_praxis/model/professional_families.dart';

class ProfessionalProyectsUserRemoteMapper {
  static ListProfessionalProyectsUser fromRemoteListProfessionalProyectsUser(
      ListProfessionalProyectsUserRemoteModel remoteModel) {
    return ListProfessionalProyectsUser(
        professionalProyectsUser: fromRemoteProfessionalProyectsUser(remoteModel.professionalProyectsUser),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

  static List<ProfessionalProyectsUser> fromRemoteProfessionalProyectsUser(
      List<ProfessionalProyectsUserRemoteModel> remoteModels) {
    List<ProfessionalProyectsUser> professionalProyectsUser = [];

    for (var remoteModel in remoteModels) {
      professionalProyectsUser.add(
        ProfessionalProyectsUser(
            idProfessionalProyects: remoteModel.idProfessionalProyects,
            nameProyect: remoteModel.nameProyect,
            descriptionProyect: remoteModel.descriptionProyect,
            websites: remoteModel.websites,
            imageProyect: remoteModel.imageProyect,
            job: remoteModel.job,
            briefcase: remoteModel.briefcase,
            initDate: remoteModel.initDate,
            endDate: remoteModel.endDate
            )
      );
    }

    return professionalProyectsUser;
  }
}
