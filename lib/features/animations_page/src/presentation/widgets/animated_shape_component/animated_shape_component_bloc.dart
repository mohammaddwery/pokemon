import 'package:flutter/material.dart';

import '../../../../../../infrastructure/core/presentation/helpers/seeded_behavior_subject_component.dart';
import 'shape.dart';

class AnimatedShapeComponentBloc {
  final animatedShapeController = SeededBehaviorSubjectComponent<Shape>(Shape.square());
  final animationDuration = const Duration(milliseconds: 600);
  final animationCurve = const Cubic(0.63, 0, 0.23, 1.17);

  onShapeClicked(Shape shape) {
    if(shape == animatedShapeController.getValue()) return;

    animatedShapeController.setValue(shape);
  }

  dispose() {
    animatedShapeController.dispose();
  }
}