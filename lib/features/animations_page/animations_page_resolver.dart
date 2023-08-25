import '../../../infrastructure/core/modules/feature_resolver.dart';
import '../../../infrastructure/core/modules/router_module.dart';
import '../../infrastructure/core/modules/injection_module.dart';
import 'src/di/animations_page_injection_module.dart';
import 'src/presentation/router/animations_page_router_module.dart';

class AnimationsPageResolver extends FeatureResolver {
  @override
  RouterModule? get routerModule => AnimationsPageRouterModule();

  @override
  InjectionModule? get injectionModule => AnimationPageInjectionModule();
}
