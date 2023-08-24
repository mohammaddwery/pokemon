import 'package:pokemon/infrastructure/core/modules/router_module.dart';
import 'injection_module.dart';

abstract class FeatureResolver {
  RouterModule? get routerModule => null;
  InjectionModule? get injectionModule => null;
}
