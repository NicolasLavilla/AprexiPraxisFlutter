import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/viewmodel/offer_company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/row_request_detail_offer.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/viewmodel/request_offer_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:go_router/go_router.dart';

class RequestOfferDetailScreen extends StatefulWidget {
  const RequestOfferDetailScreen({Key? key, required this.idOffer}) : super(key: key);
  final int idOffer;

  @override
  State<RequestOfferDetailScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<RequestOfferDetailScreen> {
  final RequestOfferViewModel _requestOfferViewModel =  inject<RequestOfferViewModel>();
  final OfferCompanyViewModel _offerCompanyViewModel =  inject<OfferCompanyViewModel>();
  final LoginViewModel _loginViewModel = inject<LoginViewModel>();
  late UserData userData;
  late List<DetailRequestOffer> listDetailRequestOffer;
  late int idOffer;
  late Offer? offer;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    listDetailRequestOffer = [];
    idOffer = widget.idOffer;
    offer = null;
    _loadData();
  }

  Future<void> _loadData() async {
    _loginViewModel.fetchUserDataCache();

    _loginViewModel.getUserDataCacheState.stream.listen((state) {
      if (state.status == Status.SUCCESS) {
        userData = state.data!;
        _loginViewModel.fetchCheckToken(userData.token!);
      }
    });

    _loginViewModel.getCheckTokenState.stream.listen((state) {
      if (state.status == Status.SUCCESS) {
        if (state.data?.checkToken == true) {
          _requestOfferViewModel.fetchListDetailRequestOfferStateUser(
            userData.userId!.toInt(),
            idOffer,
            userData.token!,
          );

          _offerCompanyViewModel.fetchOfferCompanyUser(
            idOffer,
            userData.userId!.toInt(),
            userData.token!,
          );
        } else {
          context.go(NavigationRoutes.LOGIN_SCREEN_ROUTE);
        }
      }
    });

    _offerCompanyViewModel.getOfferCompanyUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          isLoading = true;
          break;
        case Status.SUCCESS:
          isLoading = false;
          if (state.data != null) {
            setState(() {
              offer = state.data!;
            });
          } else {}
          break;
        case Status.ERROR:
          isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
      setState(() {});
    });

    _requestOfferViewModel.getListDetailRequestOfferState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          isLoading = true;
          break;
        case Status.SUCCESS:
          isLoading = false;
          if (state.data != null) {
            setState(() {
              listDetailRequestOffer = state.data!.detailRequestOffer;
            });
          } else {}
          break;
        case Status.ERROR:
          isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
      setState(() {});
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(offer != null ? offer!.offerTitle : ''),
    ),
    body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
            child: _buildOfferList(),
          ),
  );
}


  Widget _buildOfferList() {
    if (listDetailRequestOffer.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: listDetailRequestOffer.length,
        itemBuilder: (_, index) {
          final detailRequestOffer = listDetailRequestOffer[index];
          return RowRequestDetailOffer(detailRequestOffer: detailRequestOffer);
        },
      );
    }
  }

  @override
  void dispose() {
    _requestOfferViewModel.dispose();
    _loginViewModel.dispose();
    _offerCompanyViewModel.dispose();
    super.dispose();
  }
}
