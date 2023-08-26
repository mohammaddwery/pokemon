import '../../infrastructure/core/modules/feature_resolver.dart';
import '../../infrastructure/core/modules/injection_module.dart';
import '../di/app_injection_module.dart';

class AppResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => AppInjectionModule();
}
