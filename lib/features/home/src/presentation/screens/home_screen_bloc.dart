import 'package:flutter/cupertino.dart';
import 'package:pokemon/infrastructure/common/presentation/navigator/animations_page_navigator.dart';
import '../../../../../infrastructure/core/presentation/helpers/behavior_subject_component.dart';

class HomeScreenBloc {
  final AnimationsPageNavigator _animationsPageNavigator;
  HomeScreenBloc({
    required AnimationsPageNavigator animationsPageNavigator,
  }): _animationsPageNavigator = animationsPageNavigator;

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
    // TODO
  }


  dispose() {
    textEditingController.dispose();
    textFieldContentController.dispose();
  }
}