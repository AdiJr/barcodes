import 'package:barcodes/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: HomeScreen.route,
    routes: <GoRoute>[
      GoRoute(
        path: HomeScreen.route,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      ),
    ],
  );
}
