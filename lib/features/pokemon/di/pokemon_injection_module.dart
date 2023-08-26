import 'dart:async';
import 'package:pokemon/features/pokemon/src/presentation/screens/pokemons_screen_bloc.dart';
import '../../../../infrastructure/core/core/app_build_config.dart';
import '../../../../infrastructure/core/injection/injector.dart';
import '../../../../infrastructure/core/modules/injection_module.dart';
import '../../../infrastructure/common/presentation/navigator/pokemon_navigator.dart';
import '../../../infrastructure/core/data/resources/api_manager/api_manager.dart';
import '../../../infrastructure/core/data/resources/api_manager/dio_api_manager.dart';
import '../../../infrastructure/core/data/resources/api_manager/dio_provider.dart';
import '../src/data/resources/remote/pokemon_api_provider.dart';
import '../src/presentation/router/app_pokemons_navigator.dart';

class PokemonInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required AppBuildConfig config,
  }) {
    final DioProvider dioProvider = injector.get<DioProvider>();
    final ApiManager apiManager = injector.get<DioApiManager>(
        param1: dioProvider.provide(
          baseUrl: config.configs[AppBuildConfig.apiBaseUrlKey],
        )
    );

    injector
    // DATA
    ..registerFactory<PokemonApiProvider>(() => AppPokemonApiProvider(apiManager: apiManager))

    // DOMAIN

    // PRESENTATION
      ..registerFactory<PokemonsScreenBloc>(() => PokemonsScreenBloc(pokemonApiProvider: injector.get()),)
      ..registerFactory<PokemonNavigator>(() => AppPokemonNavigator(),)
    ;
  }
}
