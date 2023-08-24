import 'package:flutter/material.dart';
import '../infrastructure/common/presentation/styles/app_theme_factory.dart';
import '../infrastructure/core/core/app_constants.dart';
import '../infrastructure/core/modules/router_module.dart';
import '../infrastructure/core/presentation/localization/resolution_callback.dart';
import '../infrastructure/core/core/app_build_config.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final List<LocalizationsDelegate> localeDelegates;
  final List<RouterModule> routes;
  final AppBuildConfig buildConfig;

  const MyApp({
    required this.localeDelegates,
    required this.routes,
    required this.buildConfig,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    onGenerateRoute: (settings) => generateRoute(
      settings: settings,
      routes: routes,
    ),
    navigatorKey: navigatorKey,
    theme: AppThemeFactory().getAppThemeData(),
    localeResolutionCallback: localeResolutionCallback,
    supportedLocales: appSupportedLocales,
    localizationsDelegates: localeDelegates,
    debugShowCheckedModeBanner: false,
    locale: appSupportedLocales.first,
  );

  Route<dynamic>? generateRoute({
    required List<RouterModule> routes,
    required RouteSettings settings,
  }) {
    final routesMap = <String, MaterialPageRoute>{};
    for (final route in routes) {
      routesMap.addAll(route.getRoutes(settings));
    }
    return routesMap[settings.name];
  }
}
