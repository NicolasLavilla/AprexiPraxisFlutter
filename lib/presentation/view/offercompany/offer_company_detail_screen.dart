import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/viewmodel/offer_company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:go_router/go_router.dart';

class OfferDetailScreen extends StatefulWidget {
  const OfferDetailScreen({Key? key, required this.idOffer}) : super(key: key);
  final int idOffer;

  @override
  State<OfferDetailScreen> createState() => _OfferDetailScreenState();
}

class _OfferDetailScreenState extends State<OfferDetailScreen> {
  final OfferCompanyViewModel _offerCompanyViewModel =
      inject<OfferCompanyViewModel>();
  final LoginViewModel _loginViewModel = inject<LoginViewModel>();
  late UserData _userData;
  late Offer? _offer;
  late int _idOffer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _offer = null;
    _idOffer = widget.idOffer;
    _loadData();
  }

  Future<void> _loadData() async {
    _loginViewModel.fetchUserDataCache();

    _loginViewModel.getUserDataCacheState.stream.listen((state) {
      if (state.status == Status.SUCCESS) {
        _userData = state.data!;
        _loginViewModel.fetchCheckToken(_userData.token!);
      }
    });

    _loginViewModel.getCheckTokenState.stream.listen((state) {
      if (state.status == Status.SUCCESS) {
        if (state.data?.checkToken == true) {
          _offerCompanyViewModel.fetchOfferCompanyUser(
            _idOffer,
            _userData.userId!.toInt(),
            _userData.token!,
          );
        } else {
          context.go(NavigationRoutes.LOGIN_SCREEN_ROUTE);
        }
      }
    });

    _offerCompanyViewModel.getOfferCompanyUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          if (state.data != null) {
            setState(() {
              _offer = state.data!;
            });
          } else {}
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _offer != null
              ? NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        title: Text(_offer!.offerTitle),
                        pinned: true,
                        expandedHeight: 200.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: _offer!.imageCompany != null &&
                                  _offer!.imageCompany!.isNotEmpty
                              ? Image.network(
                                  _offer!.imageCompany!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.business,
                                  size: 60.0,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: buildOfferDetails(),
                  ),
                )
              : const Center(child: Text('No offer available')),
    );
  }

  Widget buildOfferDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(children: [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: Image.network(
                  _offer!.logoCompany,
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.go(NavigationRoutes.COMPANY_SCREEN_ROUTE,
                    extra: _offer!.idCompany);
              },
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(8.0), // Ajusta según tu diseño
                ),
                child: Text(
                  _offer!.nameCompany,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D7AC0),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 10),
          const Text(
            "Requisitos",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Estudios Mínimos",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _offer!.nameTypeStudies.toString(),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const Text(
                            "Experiencia Mínima",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _offer!.minExperience.toString(),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Idiomas Requeridos",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _offer!.combinedLanguages.toString(),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        children: [
                          const Text(
                            "Carnets",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _offer!.combinedLicenses.toString(),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Requisitos Mínimos",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _offer!.minRequirements.toString(),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          const Text(
            "Descripcion del Puesto",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _offer!.jobDescription,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _offerCompanyViewModel.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }
}
