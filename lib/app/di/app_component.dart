import 'dart:async';
import '../../infrastructure/core/core/app_build_config.dart';
import '../../infrastructure/core/injection/app_injector.dart';
import '../../infrastructure/core/modules/injection_module.dart';

/// This is just a wrapper class that iterate through the injection modules
/// and add each dependency into the injection container.
class AppInjectionComponent {
  AppInjectionComponent._();

  static AppInjectionComponent instance = AppInjectionComponent._();

  Future<void> registerModules({
    required List<InjectionModule> modules,
    required AppBuildConfig config,
  }) async {
    for (final module in modules) {
      await module.registerDependencies(
        injector: AppInjector.I,
        config: config,
      );
    }
  }
}
