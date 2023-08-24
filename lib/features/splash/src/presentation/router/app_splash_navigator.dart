import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/navigator/splash_navigator.dart';
import '../../../../../infrastructure/core/presentation/navigator/app_navigator.dart';

class AppSplashNavigator with AppNavigator implements SplashNavigator {
  @override
  navigateToSplash(BuildContext context) => navigateAndRemoveUntill(
    context: context,
    routeName: SplashRoutes.root,
    anchor: SplashRoutes.root,
  );
}
