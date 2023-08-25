import 'package:flutter/material.dart';

class AnimationsPageRoutes {
  AnimationsPageRoutes._();

  static const String animationsScreen = 'animations-screen';
}

abstract class AnimationsPageNavigator {
  navigateToAnimationsScreen(BuildContext context, String userInput);
}
