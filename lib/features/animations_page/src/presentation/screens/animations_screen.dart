import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends BaseWidgetState<AnimationsScreen> {

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold();
  }
}
