import 'package:flutter/material.dart';
import 'package:pokemon/features/animations_page/src/presentation/widgets/animated_shape_component/shape.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';
import '../../../../../../infrastructure/common/presentation/styles/app_sizes.dart';
import '../../../../../../infrastructure/core/injection/app_injector.dart';
import 'animated_shape_component_bloc.dart';

class AnimatedShapeComponent extends StatefulWidget {
  const AnimatedShapeComponent({Key? key}) : super(key: key);

  @override
  State<AnimatedShapeComponent> createState() => _AnimatedShapeComponentState();
}

class _AnimatedShapeComponentState extends BaseWidgetState<AnimatedShapeComponent> {

  final bloc = AppInjector.I.get<AnimatedShapeComponentBloc>();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildAnimatedShape(),
        const Spacer(),
        buildShapeSelector(),
        const SizedBox(height: AppSizes.s32,),
      ],
    );
  }

  Widget buildAnimatedShape() {
    return StreamBuilder<Shape>(
      initialData: bloc.animatedShapeController.getValue(),
      stream: bloc.animatedShapeController.stream,
      builder: (context, shapeSnapshot) {
        final shape = shapeSnapshot.data!;
        final shapeDimension = height* .4;
        return AnimatedContainer(
          duration: bloc.animationDuration,
          curve: bloc.animationCurve,
          width: shapeDimension,
          height: shapeDimension,
          decoration: BoxDecoration(
            color: shape.background,
            borderRadius: BorderRadius.circular(shape.cornerRadiusRatio* shapeDimension),
          ),
        );
      },
    );
  }

  Widget buildShapeSelector() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildShape(Shape.square()),
        buildShape(Shape.roundedRectangle()),
        buildShape(Shape.circle()),
      ],
    );
  }

  Widget buildShape(Shape shape) {
    final shapeDimension = width* .15;
    return GestureDetector(
      onTap: () => bloc.onShapeClicked(shape),
      child: Container(
        width: shapeDimension,
        height: shapeDimension,
        decoration: BoxDecoration(
          color: shape.background,
          borderRadius: BorderRadius.circular(shape.cornerRadiusRatio* shapeDimension),
        ),
      ),
    );
  }
}
