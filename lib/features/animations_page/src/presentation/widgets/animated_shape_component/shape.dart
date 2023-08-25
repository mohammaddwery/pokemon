import 'package:flutter/material.dart';
import '../../../../../../infrastructure/common/presentation/styles/app_colors.dart';

class Shape {
  final Color background;
  final double cornerRadiusRatio;
  Shape({
    required this.background,
    required this.cornerRadiusRatio,
  });

  factory Shape.square() => Shape(background: AppColors.secondary, cornerRadiusRatio: 0);
  factory Shape.roundedRectangle() => Shape(background: AppColors.primary, cornerRadiusRatio: .25);
  factory Shape.circle() => Shape(background: AppColors.red, cornerRadiusRatio: 1);
}