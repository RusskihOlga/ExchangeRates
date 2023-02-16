import 'package:exchange_rates/core/animation/slide_route.dart';
import 'package:exchange_rates/presentation/pages/chart_page.dart';
import 'package:exchange_rates/presentation/pages/convert_page.dart';
import 'package:exchange_rates/presentation/pages/currency_page.dart';
import 'package:exchange_rates/presentation/pages/home_page.dart';
import 'package:exchange_rates/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/home",
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainPage(page: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/currency',
          builder: (BuildContext context, GoRouterState state) {
            return const CurrencyPage();
          },
        ),
        GoRoute(
          path: '/convert',
          builder: (context, state) {
            return const ConvertPage();
          },
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/chart',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: ChartPage(currency: (state.extra as Map)["currency"]),
        );
      },
    ),
  ],
);
