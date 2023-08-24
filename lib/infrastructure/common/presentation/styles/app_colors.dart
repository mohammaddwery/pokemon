import 'package:flutter/material.dart';

class AppColors {
  static const Color secondary = Color(0xFF0E91E5);
  static const Color onSecondary = Colors.black;
  static const Color dividerColor = Color(0xFF9C9C9C);
  static const Color primary = Color(0xFF0054B4);
  static const Color onPrimary = Colors.white;
  static const Color bgColor = Colors.white;
  static const Color navBarBgColor = Colors.white;
  static const Color greyColor = Color(0xFFC9C9C9);
  static const Color darkGreyColor = Color(0xFF9B9B9B);
  static Color yellowWithOpacity20 = const Color(0xFFFFE06A).withOpacity(0.2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color greyShade900 = Color(0xFF212121);
  static const Color greyShade700 = Color(0xFF616161);
  static const Color greyShade500 = Color(0xFF9E9E9E);
  static const Color greyShade400 = Color(0xFFBDBDBD);
  static const Color separator = Color(0xFFB8B8B8);
  static const Color appbar = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color lightIconButton = Color(0xFFFFFFFF);
  static const Color calendarBackgroundColor = Color(0xFFF6F6F6);
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color yellowShade800 = Color(0xFFF9A825);
  static const Color pink = Color(0xFFFFE7E7);


  static BoxShadow get cardShadow => BoxShadow(
    color: Colors.black.withOpacity(0.075),
    blurRadius: 8,
    spreadRadius: 0,
    offset: const Offset(0.0, 1.0,),
  );
  static BoxShadow get appbarShadow => BoxShadow(
    color: Colors.black.withOpacity(0.10),
    blurRadius: 14,
    spreadRadius: 0,
    offset: const Offset(0.0, 1.5,),
  );
}