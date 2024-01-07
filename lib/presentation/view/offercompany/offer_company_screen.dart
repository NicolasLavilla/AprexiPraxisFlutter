import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/row_offer_company.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/viewmodel/offer_company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/loading/loading_view.dart';
import 'package:go_router/go_router.dart';

class OfferCompanyScreen extends StatefulWidget {
  const OfferCompanyScreen({Key? key}) : super(key: key);

  @override
  State<OfferCompanyScreen> createState() => _OfferCompanyScreenState();
}

class _OfferCompanyScreenState extends State<OfferCompanyScreen> {
  final OfferCompanyViewModel _offerCompanyViewModel =
      inject<OfferCompanyViewModel>();
  final LoginViewModel _loginViewModel = inject<LoginViewModel>();
  late List<Offer> _listOfferCompany;
  late UserData _userData;

  @override
  void initState() {
    super.initState();
    _listOfferCompany = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  Future<void> _loadData() async {
    _offerCompanyViewModel.getListOfferCompanyUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            if (state.data!.success == true) {
              _listOfferCompany = state.data!.offer;
            } else {
              _listOfferCompany = [];
            }
          });
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.getCheckTokenState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          if (state.data?.checkToken == true) {
            _offerCompanyViewModel.fetchListOfferCompanyUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
          } else {
            context.go(NavigationRoutes.LOGIN_SCREEN_ROUTE);
          }
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.getUserDataCacheState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          _userData = state.data!;
          _loginViewModel.fetchCheckToken(_userData.token!);
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.fetchUserDataCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Ofertas"),
      ),
      body: SafeArea(
        child: _buildOfferList(),
      ),
    );
  }

  Widget _buildOfferList() {
    if (_listOfferCompany.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: _listOfferCompany.length,
        itemBuilder: (_, index) {
          final offer = _listOfferCompany[index];
          return RowOfferCompany(offer: offer);
        },
      );
    }
  }

  @override
  void dispose() {
    _offerCompanyViewModel.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }
}
