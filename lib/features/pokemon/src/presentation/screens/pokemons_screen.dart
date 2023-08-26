import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({Key? key}) : super(key: key);

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends BaseWidgetState<PokemonsScreen> {

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold();
  }
}
