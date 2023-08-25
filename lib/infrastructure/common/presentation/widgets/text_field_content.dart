import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class TextFieldContent extends StatelessWidget {
  final String? content;
  const TextFieldContent(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content??'',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: AppColors.greyShade900,
      ),
    );
  }
}
