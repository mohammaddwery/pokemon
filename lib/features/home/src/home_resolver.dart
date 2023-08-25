import '../../../infrastructure/core/modules/feature_resolver.dart';
import '../../../infrastructure/core/modules/injection_module.dart';
import '../../../infrastructure/core/modules/router_module.dart';
import 'di/home_injection_module.dart';
import 'presentation/router/home_router_module.dart';

class HomeResolver extends FeatureResolver {
  @override
  RouterModule? get routerModule => HomeRouterModule();

  @override
  InjectionModule? get injectionModule => HomeInjectionModule();
}
