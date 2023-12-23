import 'package:flutter_aprexi_praxis/data/offer/remote/model/offer_remote_model.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';

class OfferRemoteMapper {
  static ListOfferCompany fromRemoteListOfferCompany(ListOfferCompanyRemoteModel remoteModel) {
    return ListOfferCompany(
        offer: fromRemoteListOffer(remoteModel.offer),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

  /*static ListOfferCompanyRemoteModel toRemote(ListOfferCompany model) {
    return ListOfferCompanyRemoteModel(
        offer: model.offer,
        success: model.success,
        idError: model.idError,
        messageError: model.messageError);
  }*/

  //---------------------------------------------

  static ListFollowOffer fromRemoteListFollowOffer(ListFollowOfferRemoteModel remoteModel) {
    return ListFollowOffer(
        offer: fromRemoteListOffer(remoteModel.offer),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

  static List<Offer> fromRemoteListOffer(List<OfferRemoteModel> remoteModels) {
    List<Offer> offers = [];

    for (var remoteModel in remoteModels) {
      offers.add(
        Offer(
          idOffer: remoteModel.idOffer,
          idCompany: remoteModel.idCompany,
          nameCompany: remoteModel.nameCompany,
          nameModality: remoteModel.nameModality,
          datePublication: remoteModel.datePublication,
          nameWorking: remoteModel.nameWorking,
          nameContract: remoteModel.nameContract,
          numVacancies: remoteModel.numVacancies,
          nameTypeStudies: remoteModel.nameTypeStudies,
          nameStudies: remoteModel.nameStudies,
          nameSkills: remoteModel.nameSkills,
          minRequirements: remoteModel.minRequirements,
          jobDescription: remoteModel.jobDescription,
          numRegistered: remoteModel.numRegistered,
          nameMunicipality: remoteModel.nameMunicipality,
          salary: remoteModel.salary,
          offerTitle: remoteModel.offerTitle,
          logoCompany: remoteModel.logoCompany,
          imageCompany: remoteModel.imageCompany,
          combinedLanguages: remoteModel.combinedLanguages,
          combinedLicenses: remoteModel.combinedLicenses,
          minExperience: remoteModel.minExperience,
          followCompany: remoteModel.followCompany,
          followOffer: remoteModel.followOffer,
          requestOffer: remoteModel.requestOffer,
        ),
      );
    }

    return offers;
  }

  static Offer fromRemoteOffer(OfferRemoteModel remoteModel) {
    return Offer(
      idOffer: remoteModel.idOffer,
      idCompany: remoteModel.idCompany,
      nameCompany: remoteModel.nameCompany,
      nameModality: remoteModel.nameModality,
      datePublication: remoteModel.datePublication,
      nameWorking: remoteModel.nameWorking,
      nameContract: remoteModel.nameContract,
      numVacancies: remoteModel.numVacancies,
      nameTypeStudies: remoteModel.nameTypeStudies,
      nameStudies: remoteModel.nameStudies,
      nameSkills: remoteModel.nameSkills,
      minRequirements: remoteModel.minRequirements,
      jobDescription: remoteModel.jobDescription,
      numRegistered: remoteModel.numRegistered,
      nameMunicipality: remoteModel.nameMunicipality,
      salary: remoteModel.salary,
      offerTitle: remoteModel.offerTitle,
      logoCompany: remoteModel.logoCompany,
      imageCompany: remoteModel.imageCompany,
      combinedLanguages: remoteModel.combinedLanguages,
      combinedLicenses: remoteModel.combinedLicenses,
      minExperience: remoteModel.minExperience,
      followCompany: remoteModel.followCompany,
      followOffer: remoteModel.followOffer,
      requestOffer: remoteModel.requestOffer,
    );
  }



static ListRequestOffer fromRemoteListRequestOffer(ListRequestOfferRemoteModel remoteModel) {
    return ListRequestOffer(
        requestOffer: fromRemoteRequestOffers(remoteModel.requestOffer),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

static List<RequestOffer> fromRemoteRequestOffers(List<RequestOfferRemoteModel> remoteModels) {
    List<RequestOffer> requestOffers = [];

    for (var remoteModel in remoteModels) {
      requestOffers.add(
        RequestOffer(
          idRequestOffer: remoteModel.idRequestOffer,
          idOffer: remoteModel.idOffer,
          idCompany: remoteModel.idCompany,
          nameCompany: remoteModel.nameCompany,
          datePublication: remoteModel.datePublication,
          numRegistered: remoteModel.numRegistered,
          offerTitle: remoteModel.offerTitle,
          logoCompany: remoteModel.logoCompany,
          dateRequest: remoteModel.dateRequest,
          stateRequest: remoteModel.stateRequest,
          nameState: remoteModel.nameState
        ),
      );
    }

    return requestOffers;
  }



  static ListDetailRequestOffer fromRemoteListDetailRequestOffer(ListDetailRequestOfferRemoteModel remoteModel) {
    return ListDetailRequestOffer(
        detailRequestOffer: fromRemoteDetailRequestOffers(remoteModel.detailRequestOffer),
        success: remoteModel.success,
        idError: remoteModel.idError,
        messageError: remoteModel.messageError);
  }

static List<DetailRequestOffer> fromRemoteDetailRequestOffers(List<DetailRequestOfferRemoteModel> remoteModels) {
    List<DetailRequestOffer> requestOffers = [];

    for (var remoteModel in remoteModels) {
      requestOffers.add(
        DetailRequestOffer(
          descriptionActionRequest: remoteModel.descriptionActionRequest,
          dateRequest: remoteModel.dateRequest,
          stateRequest: remoteModel.stateRequest,
          nameState: remoteModel.nameState
        ),
      );
    }

    return requestOffers;
  }
}