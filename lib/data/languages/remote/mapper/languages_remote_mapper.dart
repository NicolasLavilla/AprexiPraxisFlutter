import 'package:flutter_aprexi_praxis/data/languages/remote/model/languages_data_model.dart';
import 'package:flutter_aprexi_praxis/model/languages.dart';

class LanguagesUserRemoteMapper {

static ListLanguagesUser fromRemoteListRequestOffer(ListLanguagesUserRemoteModel remoteModel) {
    return ListLanguagesUser(
        languagesUser: fromRemoteRequestOffers(remoteModel.languagesUser),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

static List<LanguagesUser> fromRemoteRequestOffers(List<LanguagesUserRemoteModel> remoteModels) {
    List<LanguagesUser> langaugesUser = [];

    for (var remoteModel in remoteModels) {
      langaugesUser.add(
        LanguagesUser(
          idLanguagesUser: remoteModel.idLanguagesUser,
          idLanguages: remoteModel.idLanguages,
          nameLanguages: remoteModel.nameLanguages,
          idExperience: remoteModel.idExperience,
          nameExperience: remoteModel.nameExperience
        ),
      );
    }

    return langaugesUser;
  }
}