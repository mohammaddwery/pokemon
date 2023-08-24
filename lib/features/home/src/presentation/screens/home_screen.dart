import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseWidgetState<HomeScreen> {

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold();
  }
}
