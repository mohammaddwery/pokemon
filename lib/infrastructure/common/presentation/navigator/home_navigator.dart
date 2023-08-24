import 'package:flutter/material.dart';

class HomeRoutes {
  HomeRoutes._();

  static const String home = 'home';
}

abstract class HomeNavigator {
  navigateToHome(BuildContext context,);
}
