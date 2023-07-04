import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialExtra: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (BuildContext context, GoRouterState state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (BuildContext context, GoRouterState state) => const CardsScreen(),
    ),
  ],
);