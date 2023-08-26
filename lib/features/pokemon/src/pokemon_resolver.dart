import '../../../infrastructure/core/modules/feature_resolver.dart';
import '../../../infrastructure/core/modules/injection_module.dart';
import '../../../infrastructure/core/modules/router_module.dart';
import '../di/pokemon_injection_module.dart';
import 'presentation/router/pokemon_router_module.dart';

class PokemonResolver extends FeatureResolver {
  @override
  RouterModule? get routerModule => PokemonRouterModule();

  @override
  InjectionModule? get injectionModule => PokemonInjectionModule();
}
