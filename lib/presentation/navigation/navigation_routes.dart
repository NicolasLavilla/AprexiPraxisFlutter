// ignore_for_file: constant_identifier_names

import 'package:flutter_aprexi_praxis/presentation/view/login/login_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/offer_company_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/myoffers/page_view.dart';
import 'package:flutter_aprexi_praxis/presentation/view/scaffold_width_nav_bar.dart';
import 'package:go_router/go_router.dart';

class NavigationRoutes {
  static const LOGIN_SCREEN_ROUTE = '/login';
  static const LIST_OFFER_COMPANY_SCREEN_ROUTE = '/offer';
  static const LIST_REQUEST_OFFER_SCREEN_ROUTE = '/request';
  static const MY_OFFERS_SCREEN_ROUTE = '/follow';

  final GoRouter router =
      GoRouter(initialLocation: NavigationRoutes.LOGIN_SCREEN_ROUTE, routes: [
    GoRoute(
      path: NavigationRoutes.LOGIN_SCREEN_ROUTE,
      builder: (context, state) => const LoginScreen(),
    ),
    
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavigationRoutes.LIST_OFFER_COMPANY_SCREEN_ROUTE,
                builder: (context, state) => const OfferCompanyScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavigationRoutes.MY_OFFERS_SCREEN_ROUTE,
              builder: (context, state) => MyPageView(),
              )
            ],
          ),
        ]),
  ]);
}
