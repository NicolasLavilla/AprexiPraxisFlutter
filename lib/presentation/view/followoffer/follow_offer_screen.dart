
import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/data/login/local/cache/shared_preferences.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/view/followoffer/viewmodel/follow_offer_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/row_offer_company.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/loading/loading_view.dart';
class FollowOfferScreen extends StatefulWidget {
  const FollowOfferScreen({Key? key}) : super(key: key);

  @override
  State<FollowOfferScreen> createState() => _FollowOfferScreenState();
}

class _FollowOfferScreenState extends State<FollowOfferScreen> {
  final FollowOfferViewModel _followOfferViewModel =
      inject<FollowOfferViewModel>();
  late List<Offer> _listFollowOffer;

  @override
  void initState() {
    super.initState();
    _listFollowOffer = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(); // Llama a la función para cargar datos cuando cambian las dependencias
  }

  Future<void> _loadData() async {
    final userData = await SharedPreferencesHelper.getUserData(); // Obtener datos del usuario

    _followOfferViewModel.getListFollowOfferState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            if (state.data!.success == true) {
              _listFollowOffer = state.data!.offer;
            } else {
              _listFollowOffer = [];
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

    _followOfferViewModel.fetchListFollowOfferStateUser(
      userData.userId!.toInt(),
      userData.token!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ofertas Guardadas"),
      ),
      body: SafeArea(
        child: _buildOfferList(),
      ),
    );
  }

  Widget _buildOfferList() {
    if (_listFollowOffer.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: _listFollowOffer.length,
        itemBuilder: (_, index) {
          final offer = _listFollowOffer[index];
          return RowOfferCompany(offer: offer); // Usar el nuevo widget OfferRow
        },
      );
    }
  }

  @override
  void dispose() {
    _followOfferViewModel.dispose();
    super.dispose();
  }
}
