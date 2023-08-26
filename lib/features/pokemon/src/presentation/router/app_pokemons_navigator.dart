import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/pokemon_navigator.dart';
import '../../../../../infrastructure/core/presentation/navigator/app_navigator.dart';

class AppPokemonNavigator with AppNavigator implements PokemonNavigator {
  @override
  navigateToPokemonsScreen(BuildContext context) => navigateTo(
    context: context,
    routeName: PokemonRoutes.pokemonsScreen,
  );
}
