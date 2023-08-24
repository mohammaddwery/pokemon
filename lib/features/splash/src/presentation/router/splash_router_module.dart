import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/splash_navigator.dart';
import '../../../../../infrastructure/core/modules/router_module.dart';
import '../screens/splash_screen.dart';


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
