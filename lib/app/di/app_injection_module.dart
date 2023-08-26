import 'dart:async';
import 'package:pokemon/infrastructure/core/core/app_build_config.dart';
import '../../infrastructure/core/data/resources/api_manager/api_error_handler.dart';
import '../../infrastructure/core/data/resources/api_manager/dio_api_manager.dart';
import '../../infrastructure/core/data/resources/api_manager/dio_provider.dart';
import '../../infrastructure/core/injection/injector.dart';
import '../../infrastructure/core/modules/injection_module.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required AppBuildConfig config,
  }) async {
    injector
      ..registerSingleton<AppBuildConfig>(config)
      ..registerFactory<ApiErrorHandler>(() => const ApiErrorHandler())
      ..registerFactory<DioProvider>(() => DioProvider())
      ..registerFactoryParam((dio, _) => DioApiManager(
        dio: dio,
        apiErrorHandler: injector.get(),
      ))
    ;
  }
}
