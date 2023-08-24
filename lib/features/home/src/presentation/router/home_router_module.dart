import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/navigator/home_navigator.dart';
import '../../../../../infrastructure/core/modules/router_module.dart';
import '../screens/home_screen.dart';


class HomeRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        HomeRoutes.home: MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        ),
      };
}
