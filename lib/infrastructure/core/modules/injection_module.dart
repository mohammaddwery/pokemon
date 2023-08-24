import 'dart:async';
import '../core/app_build_config.dart';
import '../injection/injector.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({
    required Injector injector,
    required AppBuildConfig config,
  });
}
