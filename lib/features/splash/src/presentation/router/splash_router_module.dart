import 'package:flutter/material.dart';
import '../../../../../infrastructure/core/modules/router_module.dart';
import '../screens/splash_screen.dart';

class SplashRoutes {
  SplashRoutes._();

  static const String root = '/';
}

class SplashRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        SplashRoutes.root: MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        ),
      };
}
