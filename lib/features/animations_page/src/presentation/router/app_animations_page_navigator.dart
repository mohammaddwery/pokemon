import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/animations_page_navigator.dart';
import '../../../../../infrastructure/core/presentation/navigator/app_navigator.dart';

class AppAnimationsPageNavigator with AppNavigator implements AnimationsPageNavigator {
  @override
  navigateToAnimationsScreen(BuildContext context, String userInput) => navigateTo(
    context: context,
    routeName: AnimationsPageRoutes.animationsScreen,
    arguments: userInput,
  );
}
