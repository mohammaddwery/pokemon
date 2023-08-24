import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/home_navigator.dart';
import '../../../../../infrastructure/core/presentation/navigator/app_navigator.dart';

class AppHomeNavigator with AppNavigator implements HomeNavigator {
  @override
  navigateToHome(BuildContext context) => navigateReplacement(
    context: context,
    routeName: HomeRoutes.home,
  );
}
