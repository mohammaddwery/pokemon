import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/pokemon_navigator.dart';
import '../../../../../infrastructure/core/modules/router_module.dart';
import '../screens/pokemons_screen.dart';


class PokemonRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        PokemonRoutes.pokemonsScreen: MaterialPageRoute(
          builder: (_) => const PokemonsScreen(),
          settings: settings,
        ),
      };
}
