import 'package:flutter_aprexi_praxis/data/studies/remote/model/studies_data_model.dart';
import 'package:flutter_aprexi_praxis/model/studies.dart';


class StudiesUserRemoteMapper {


static ListStudiesUser fromRemoteListRequestOffer(ListStudiesUserRemoteModel remoteModel) {
    return ListStudiesUser(
        studiesUser: fromRemoteRequestOffers(remoteModel.studiesUser),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

static List<StudiesUser> fromRemoteRequestOffers(List<StudiesUserRemoteModel> remoteModels) {
    List<StudiesUser> studiesUser = [];

    for (var remoteModel in remoteModels) {
      studiesUser.add(
        StudiesUser(
          idStudiesUser: remoteModel.idStudiesUser,
          idNameStudies: remoteModel.idStudiesUser,
          nameStudies: remoteModel.nameStudies,
          typeStudies: remoteModel.typeStudies,
          nameTypeStudies: remoteModel.nameTypeStudies,
          professionalFamilies: remoteModel.professionalFamilies,
          nameFamily: remoteModel.nameFamily,
          idSchool: remoteModel.idSchool,
          nameSchool: remoteModel.nameSchool,
          startYear: remoteModel.startYear,
          endYear: remoteModel.endYear
        ),
      );
    }

    return studiesUser;
  }
}