import 'package:flutter/material.dart';

class PokemonRoutes {
  PokemonRoutes._();

  static const String pokemonsScreen = 'pokemons-screen';
}

abstract class PokemonNavigator {
  navigateToPokemonsScreen(BuildContext context,);
}
