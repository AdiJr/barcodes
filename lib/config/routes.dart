import 'package:flutter/material.dart';
import 'package:flutter_template/ui/home/home_screen.dart';
import 'package:routemaster/routemaster.dart';

class Routes {
  static const initialRoute = '/';

  //TODO: define different maps for specific scenarios (loggedIn, loggedOut, etc.)
  static final RouteMap defaultMap = RouteMap(
    routes: {
      HomeScreen.route: (route) => const MaterialPage<dynamic>(
            child: HomeScreen(),
          ),
    },
    onUnknownRoute: (_) => Redirect(HomeScreen.route),
  );
}
