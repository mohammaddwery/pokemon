import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/widgets/text_field_content.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';
import '../../../../../infrastructure/common/presentation/helpers/app_subtitles_keys.dart';
import '../../../../../infrastructure/common/presentation/styles/app_sizes.dart';
import '../../../../../infrastructure/common/presentation/widgets/general_app_bar.dart';
import '../widgets/animated_shape_component/animated_shape_component.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends BaseWidgetState<AnimationsScreen> {

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(AppSubtitlesKeys.animations, hasBackButton: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppSizes.s32,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
            child: TextFieldContent(ModalRoute.of(context)!.settings.arguments as String),
          ),
          const SizedBox(height: AppSizes.s48,),
          const Expanded(child: AnimatedShapeComponent()),
        ],
      ),
    );
  }
}
