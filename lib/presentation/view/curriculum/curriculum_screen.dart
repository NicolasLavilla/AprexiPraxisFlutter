import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/experience_job.dart';
import 'package:flutter_aprexi_praxis/model/languages.dart';
import 'package:flutter_aprexi_praxis/model/license.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/model/professional_families.dart';
import 'package:flutter_aprexi_praxis/model/studies.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/row_experience_job_user_curriculum.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/row_languages_user_curriculum.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/row_license_user_curriculum.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/row_professional_proyects_user_curriculum.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/row_studies_user_curriculum.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/viewmodel/curriculum_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:go_router/go_router.dart';

class CurriculumScreen extends StatefulWidget {
  const CurriculumScreen({Key? key}) : super(key: key);

  @override
  State<CurriculumScreen> createState() => _CurriculumScreenState();
}

class _CurriculumScreenState extends State<CurriculumScreen> {
  final CurriculumViewModel _curriculumViewModel =
      inject<CurriculumViewModel>();
  final LoginViewModel _loginViewModel = inject<LoginViewModel>();
  late List<StudiesUser> _listStudiesUser;
  late List<LanguagesUser> _listLanguagesUser;
  late List<ExperienceJobUser> _listExperienceJobUser;
  late List<LicenseUser> _listLicenseUser;
  late List<ProfessionalProyectsUser> _listProfessionalProyects;
  late UserData _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _listStudiesUser = [];
    _listLanguagesUser = [];
    _listExperienceJobUser = [];
    _listLicenseUser = [];
    _listProfessionalProyects = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  Future<void> _loadData() async {
    _curriculumViewModel.getListStudiesUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          setState(() {
            if (state.data!.success == true) {
              _listStudiesUser = state.data!.studiesUser;
            } else {
              _listStudiesUser = [];
            }
          });
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _curriculumViewModel.getListLanguagesUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          setState(() {
            if (state.data!.success == true) {
              _listLanguagesUser = state.data!.languagesUser;
            } else {
              _listLanguagesUser = [];
            }
          });
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _curriculumViewModel.getListLicenseUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          setState(() {
            if (state.data!.success == true) {
              _listLicenseUser = state.data!.licenseUser;
            } else {
              _listLicenseUser = [];
            }
          });
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _curriculumViewModel.getListProfessionalProyectsUserState.stream
        .listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          setState(() {
            if (state.data!.success == true) {
              _listProfessionalProyects = state.data!.professionalProyectsUser;
            } else {
              _listProfessionalProyects = [];
            }
          });
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _curriculumViewModel.getListExperienceJobUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          setState(() {
            if (state.data!.success == true) {
              _listExperienceJobUser = state.data!.experienceJobUser;
            } else {
              _listExperienceJobUser = [];
            }
          });
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.getCheckTokenState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          if (state.data?.checkToken == true) {
            _curriculumViewModel.fetchUserDataStateUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
            _curriculumViewModel.fetchListStudiesStateUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
            _curriculumViewModel.fetchListExperienceJobUserStateUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
            _curriculumViewModel.fetchListLangaugesStateUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
            _curriculumViewModel.fetchListLicenseUserStateUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
            _curriculumViewModel.fetchListProfessionalProyectsStateUser(
              _userData.userId!.toInt(),
              _userData.token!,
            );
          } else {
            context.go(NavigationRoutes.LOGIN_SCREEN_ROUTE);
          }
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.getUserDataCacheState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          _isLoading = true;
          break;
        case Status.SUCCESS:
          _isLoading = false;
          _userData = state.data!;
          _loginViewModel.fetchCheckToken(_userData.token!);
          break;
        case Status.ERROR:
          _isLoading = false;
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.fetchUserDataCache();
  }

  @override
  void dispose() {
    _curriculumViewModel.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Curriculum"),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Studies",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      _buildStudiesList(),
                      const Text(
                        "Languages",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      _buildLanguagesList(),
                      const Text(
                        "Professional Proyects",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      _buildProfessionalProyectsList(),
                      const Text(
                        "License",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      _buildLicenseList(),
                      const Text(
                        "Experience",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      _buildExperienceJobUserList()
                    ],
                  ),
                ),
              ));
  }

  Widget _buildStudiesList() {
    return Column(
      children: _listStudiesUser.isEmpty
          ? [const CircularProgressIndicator()]
          : _listStudiesUser.map((studies) {
              return RowStudiesUserCurriculum(studies: studies);
            }).toList(),
    );
  }

  Widget _buildLanguagesList() {
    return Column(
      children: _listLanguagesUser.isEmpty
          ? [const CircularProgressIndicator()]
          : _listLanguagesUser.map((languages) {
              return RowLanguagesUserCurriculum(languages: languages);
            }).toList(),
    );
  }

  Widget _buildExperienceJobUserList() {
    return Column(
      children: _listExperienceJobUser.isEmpty
          ? [const CircularProgressIndicator()]
          : _listExperienceJobUser.map((experienceJobUser) {
              return RowExperienceUserCurriculum(
                experienceJobUser: experienceJobUser,
              );
            }).toList(),
    );
  }

  Widget _buildProfessionalProyectsList() {
    return Column(
      children: _listProfessionalProyects.isEmpty
          ? [const CircularProgressIndicator()]
          : _listProfessionalProyects.map((professionalProyects) {
              return RowProfessionalProyectsUserCurriculum(
                professionalProyects: professionalProyects,
              );
            }).toList(),
    );
  }

  Widget _buildLicenseList() {
    return Column(
      children: _listLicenseUser.isEmpty
          ? [const CircularProgressIndicator()]
          : _listLicenseUser.map((license) {
              return RowLicenseUserCurriculum(
                license: license,
              );
            }).toList(),
    );
  }
}
