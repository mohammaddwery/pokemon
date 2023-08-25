import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/animations_page_navigator.dart';
import '../../../../../infrastructure/core/modules/router_module.dart';
import '../screens/animations_screen.dart';


class AnimationsPageRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        AnimationsPageRoutes.animationsScreen: MaterialPageRoute(
          builder: (_) => const AnimationsScreen(),
          settings: settings,
        ),
      };
}
