import 'package:flutter/cupertino.dart';
import 'package:pokemon/infrastructure/common/presentation/navigator/animations_page_navigator.dart';
import 'package:pokemon/infrastructure/common/presentation/navigator/pokemon_navigator.dart';
import '../../../../../infrastructure/core/presentation/helpers/behavior_subject_component.dart';

class HomeScreenBloc {
  final AnimationsPageNavigator _animationsPageNavigator;
  final PokemonNavigator _pokemonNavigator;
  HomeScreenBloc({
    required AnimationsPageNavigator animationsPageNavigator,
    required PokemonNavigator pokemonNavigator,
  }): _animationsPageNavigator = animationsPageNavigator,
        _pokemonNavigator = pokemonNavigator;

  final textEditingController = TextEditingController();
  final textFieldContentController = BehaviorSubjectComponent<String?>();

  onTextFieldChanged(String value) {
    textFieldContentController.setValue(value);
  }

  onClearTextClicked() {
    if(textFieldContentController.getValue() == null) return;

    textFieldContentController.setValue(null);
    textEditingController.text = '';
  }

  onPageOneNavigationButtonClicked(BuildContext context) {
    _animationsPageNavigator.navigateToAnimationsScreen(context, textEditingController.text);
  }

  onPageTwoNavigationButtonClicked(BuildContext context) {
    _pokemonNavigator.navigateToPokemonsScreen(context);
  }


  dispose() {
    textEditingController.dispose();
    textFieldContentController.dispose();
  }
}