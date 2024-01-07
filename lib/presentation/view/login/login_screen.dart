import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/di/app_modules.dart';
import 'package:flutter_aprexi_praxis/model/login.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/viewmodel/login_view_model.dart';
import 'package:flutter_aprexi_praxis/presentation/model/resource_state.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/error/error_view.dart';
import 'package:flutter_aprexi_praxis/presentation/widget/loading/loading_view.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = inject<LoginViewModel>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late UserData _userData;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _loginViewModel.getCheckTokenState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          if (state.data?.checkToken == true) {
            context.go(NavigationRoutes.LIST_OFFER_COMPANY_SCREEN_ROUTE);
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
          if(_userData.token != null){
            _loginViewModel.fetchCheckToken(_userData.token!);
          }else{

          }
          
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), () {});
          break;
      }
    });

    _loginViewModel.getLoginUserState.stream.listen((state) {
      switch (state.status) {
        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          if (state.data?.success == true) {
            context.go(NavigationRoutes.LIST_OFFER_COMPANY_SCREEN_ROUTE);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("No se ha podido acceder a la pantalla"),
                );
              },
            );
          }
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                _loginViewModel.fetchLoginUser(email, password);
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
