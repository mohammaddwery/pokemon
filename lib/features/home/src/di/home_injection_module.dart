import 'dart:async';
import 'package:pokemon/features/home/src/presentation/router/app_home_navigator.dart';
import 'package:pokemon/infrastructure/common/presentation/navigator/home_navigator.dart';
import '../../../../infrastructure/core/core/app_build_config.dart';
import '../../../../infrastructure/core/injection/injector.dart';
import '../../../../infrastructure/core/modules/injection_module.dart';

class HomeInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required AppBuildConfig config,
  }) {
    injector
    // DATA

    // DOMAIN

    // PRESENTATION
      .registerFactory<HomeNavigator>(() => AppHomeNavigator(),)
    ;
  }
}
