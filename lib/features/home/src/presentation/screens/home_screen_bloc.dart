import 'package:flutter/cupertino.dart';
import '../../../../../infrastructure/core/presentation/helpers/behavior_subject_component.dart';

class HomeScreenBloc {
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
    // TODO
  }

  onPageTwoNavigationButtonClicked(BuildContext context) {
    // TODO
  }


  dispose() {
    textEditingController.dispose();
    textFieldContentController.dispose();
  }
}