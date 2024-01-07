import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/company.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/view/company/viewmodel/company_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:go_router/go_router.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key, required this.idCompany}) : super(key: key);
  final int idCompany;

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final CompanyViewModel _companyViewModel =  inject<CompanyViewModel>();
  final LoginViewModel _loginViewModel = inject<LoginViewModel>();
  late UserData _userData;
  late Company? _company;
  late int _idCompany;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _company = null;
    _idCompany = widget.idCompany;
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
          _companyViewModel.fetchCompanyUser(
            _userData.userId!.toInt(),
            _idCompany,
            _userData.token!,
          );
        } else {
          context.go(NavigationRoutes.LOGIN_SCREEN_ROUTE);
        }
      }
    });

    _companyViewModel.getCompanyState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          if (state.data != null) {
            setState(() {
              _company = state.data!;
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
          : _company != null
              ? NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        title: Text(_company!.nameCompany),
                        pinned: true,
                        expandedHeight: 200.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: _company!.imageCompany != null &&
                                  _company!.imageCompany!.isNotEmpty
                              ? Image.network(
                                  _company!.imageCompany!,
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
        const Text(
          "Sectores Empresa",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          _company!.nameSectorBusiness,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Descripción",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          _company!.description,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Ubicación",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          _company!.nameMunicipality,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Número de empleados",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          _company!.numWorkers.toString(),
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Página Web",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          _company!.websites,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      ]
    ),
  );
}

  @override
  void dispose() {
    _companyViewModel.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }
}
