import 'dart:async';
import '../../../../infrastructure/common/presentation/navigator/animations_page_navigator.dart';
import '../../../../infrastructure/core/core/app_build_config.dart';
import '../../../../infrastructure/core/injection/injector.dart';
import '../../../../infrastructure/core/modules/injection_module.dart';
import '../presentation/router/app_animations_page_navigator.dart';

class AnimationPageInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required AppBuildConfig config,
  }) {
    injector
    // DATA

    // DOMAIN

    // PRESENTATION
      ..registerFactory<AnimationsPageNavigator>(() => AppAnimationsPageNavigator(),)
    ;
  }
}
