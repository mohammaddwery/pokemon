import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon/features/splash/splash.dart';
import '../features/animations_page/animations_page_resolver.dart';
import '../features/home/src/home_resolver.dart';
import '../features/pokemon/src/pokemon_resolver.dart';
import '../infrastructure/common/presentation/localization/app_localization_delegate.dart';
import '../infrastructure/common/presentation/styles/app_colors.dart';
import '../infrastructure/core/core/app_build_config.dart';
import '../infrastructure/core/modules/feature_resolver.dart';
import '../infrastructure/core/modules/injection_module.dart';
import '../infrastructure/core/modules/router_module.dart';
import 'my_app.dart';
import 'di/app_component.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future<void> main() => AppStart(AppBuildConfig()).startApp();

class AppStart {
  final AppBuildConfig buildConfig;
  AppStart(this.buildConfig);

  /// The order of initialization matters, otherwise you will end up with
  /// an exception because of gitIt registration.
  get resolvers => <FeatureResolver>[
    SplashScreenResolver(),
    HomeResolver(),
    AnimationsPageResolver(),
    PokemonResolver(),
  ];

  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    final routerModules = <RouterModule>[];
    final injections = <InjectionModule>[];

    for (FeatureResolver resolver in resolvers) {
      if (resolver.routerModule != null) {
        routerModules.add(resolver.routerModule!);
      }

      if (resolver.injectionModule != null) {
        injections.add(resolver.injectionModule!);
      }
    }

    await AppInjectionComponent.instance.registerModules(
      config: buildConfig,
      modules: injections,
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondary,
      ),
    );

    await runZonedGuarded<Future<void>>(
      () async {
        runApp(MyApp(
          buildConfig: buildConfig,
          routes: routerModules,
          localeDelegates: <LocalizationsDelegate>[
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            appLocalizationDelegate,
          ],
        ));
      },
      (_, onError) {
        debugPrint('runZonedGuarded() MyApp ${onError.toString()}');
      },
    );
  }
}
