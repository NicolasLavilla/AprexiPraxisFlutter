import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/data/login/local/cache/shared_preferences.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/row_request_offer.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/viewmodel/request_offer_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/loading/loading_view.dart';

class RequestOfferScreen extends StatefulWidget {
  const RequestOfferScreen({Key? key}) : super(key: key);

  @override
  State<RequestOfferScreen> createState() => _RequestOfferScreenState();
}

class _RequestOfferScreenState extends State<RequestOfferScreen> {
  final RequestOfferViewModel _requestOfferViewModel =
      inject<RequestOfferViewModel>();
  late List<RequestOffer> _listRequestOffer;

  @override
  void initState() {
    super.initState();
    _listRequestOffer = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(); // Llama a la función para cargar datos cuando cambian las dependencias
  }

  Future<void> _loadData() async {
    final userData = await SharedPreferencesHelper.getUserData();
   
    _requestOfferViewModel.getListRequestOfferState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            if (state.data!.success == true) {
              _listRequestOffer = state.data!.requestOffer;
            } else {
              _listRequestOffer = [];
            }
          });
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), () {
            // Manejar error
          });
          break;
      }
    });

    _requestOfferViewModel.fetchListRequestOfferStateUser(
        userData.userId!.toInt(),
      userData.token!);
       }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ofertas Inscritas"),
      ),
      body: SafeArea(
        child: _buildOfferList(),
      ),
    );
  }

  Widget _buildOfferList() {
    if (_listRequestOffer.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: _listRequestOffer.length,
        itemBuilder: (_, index) {
          final requestOffer = _listRequestOffer[index];
          return RowRequestOffer(requestOffer: requestOffer);
        },
      );
    }
  }

  @override
  void dispose() {
    _requestOfferViewModel.dispose();
    super.dispose();
  }
}