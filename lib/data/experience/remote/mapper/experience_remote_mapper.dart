import 'package:flutter_aprexi_praxis/data/experience/remote/model/experience_data_model.dart';
import 'package:flutter_aprexi_praxis/model/experience_job.dart';

class ExperienceJobUserRemoteMapper {

static ListExperienceJobUser fromRemoteListExperienceJobUser(ListExperienceJobUserRemoteModel remoteModel) {
    return ListExperienceJobUser(
        experienceJobUser: fromRemoteExperienceJobsUser(remoteModel.experienceJobUser),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

static List<ExperienceJobUser> fromRemoteExperienceJobsUser(List<ExperienceJobUserRemoteModel> remoteModels) {
    List<ExperienceJobUser> experienceJobUser = [];

    for (var remoteModel in remoteModels) {
      experienceJobUser.add(
        ExperienceJobUser(
          idExperienceJobUser: remoteModel.idExperienceJobUser,
          nameJobs: remoteModel.nameJobs,
          level: remoteModel.level,
          nameLevelJob: remoteModel.nameLevelJob,
          idCategory: remoteModel.idCategory,
          nameCategory: remoteModel.nameCategory,
          descriptionJob: remoteModel.descriptionJob,
          idCompany: remoteModel.idCompany,
          nameCompany: remoteModel.nameCompany,
          initDate:  remoteModel.initDate,
          endDate: remoteModel.endDate
        ),
      );
    }

    return experienceJobUser;
  }
}