import 'dart:async';
import '../../../../infrastructure/core/core/app_build_config.dart';
import '../../../../infrastructure/core/injection/injector.dart';
import '../../../../infrastructure/core/modules/injection_module.dart';
import '../../../infrastructure/common/presentation/navigator/pokemon_navigator.dart';
import '../src/presentation/router/app_pokemons_navigator.dart';

class PokemonInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required AppBuildConfig config,
  }) {
    injector
    // DATA

    // DOMAIN

    // PRESENTATION
      ..registerFactory<PokemonNavigator>(() => AppPokemonNavigator(),)
    ;
  }
}
