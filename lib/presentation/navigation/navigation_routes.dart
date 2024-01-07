// ignore_for_file: constant_identifier_names

import 'package:flutter_aprexi_praxis/presentation/view/company/company_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/curriculum/curriculum_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/login/login_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/offer_company_detail_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/offercompany/offer_company_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/myoffers/page_view.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/request_offer_detail_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/scaffold_width_nav_bar.dart';
import 'package:go_router/go_router.dart';

class NavigationRoutes {
  static const LOGIN_SCREEN_ROUTE = '/login';
  static const LIST_OFFER_COMPANY_SCREEN_ROUTE = '/';
  static const DETAIL_OFFER_COMPANY_SCREEN_ROUTE =
      '$LIST_OFFER_COMPANY_SCREEN_ROUTE$DETAIL_OFFER_COMPANY_ROUTE';
  static const COMPANY_SCREEN_ROUTE =
      '$DETAIL_OFFER_COMPANY_SCREEN_ROUTE/$COMPANY_ROUTE';
  static const DETAIL_OFFER_COMPANY_ROUTE = 'detail';
  static const COMPANY_ROUTE = 'company';
  static const MY_OFFERS_SCREEN_ROUTE = '/myOffers';
  static const DETAIL_REQUEST_OFFER_ROUTE = 'requestOffer';
  static const DETAIL_REQUEST_OFFER_SCREEN_ROUTE =
      '$MY_OFFERS_SCREEN_ROUTE/$DETAIL_REQUEST_OFFER_ROUTE';
  static const CURRICULUM_ROUTE = '/curriculum';

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
                  routes: [
                    GoRoute(
                        path: NavigationRoutes.DETAIL_OFFER_COMPANY_ROUTE,
                        builder: (context, state) =>
                            OfferDetailScreen(idOffer: state.extra as int),
                        routes: [
                          GoRoute(
                              path: NavigationRoutes.COMPANY_ROUTE,
                              builder: (context, state) =>
                                  CompanyScreen(idCompany: state.extra as int))
                        ])
                  ]),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: NavigationRoutes.MY_OFFERS_SCREEN_ROUTE,
                  builder: (context, state) => const MyPageView(),
                  routes: [
                    GoRoute(
                        path: NavigationRoutes.DETAIL_REQUEST_OFFER_ROUTE,
                        builder: (context, state) => RequestOfferDetailScreen(
                            idOffer: state.extra as int))
                  ])
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: NavigationRoutes.CURRICULUM_ROUTE,
                  builder: (context, state) => const CurriculumScreen())
            ],
          ),
        ]),
  ]);
}
