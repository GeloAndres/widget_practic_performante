import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app_performance/presentation/screen/the_barril.dart';

final GoRouter goRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/card',
    builder: (BuildContext context, GoRouterState state) => const CardsScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (BuildContext context, GoRouterState state) =>
        const ButtonsScreen(),
  ),
]);
