import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/data/login/local/cache/shared_preferences.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/row_offer_company.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/viewmodel/offer_company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/loading/loading_view.dart';

class OfferCompanyScreen extends StatefulWidget {
  const OfferCompanyScreen({Key? key}) : super(key: key);

  @override
  State<OfferCompanyScreen> createState() => _OfferCompanyScreenState();
}

class _OfferCompanyScreenState extends State<OfferCompanyScreen> {
  final OfferCompanyViewModel _offerCompanyViewModel =
      inject<OfferCompanyViewModel>();
  late List<Offer> _listOfferCompany;

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
    final userData = await SharedPreferencesHelper.getUserData();

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
          ErrorView.show(context, state.exception!.toString(), () {
          });
          break;
      }
    });

    _offerCompanyViewModel.fetchListOfferCompanyUser(
      userData.userId.toInt(),
      userData.token,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Offers"),
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
    super.dispose();
  }
}

