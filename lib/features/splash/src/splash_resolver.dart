import '../../../infrastructure/core/modules/feature_resolver.dart';
import '../../../infrastructure/core/modules/router_module.dart';
import 'presentation/router/splash_router_module.dart';

class SplashScreenResolver extends FeatureResolver {
  @override
  RouterModule? get routerModule => SplashRouterModule();
}
