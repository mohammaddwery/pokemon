import 'package:flutter/material.dart';
import '../helpers/error_message_factory.dart';
import '../styles/app_sizes.dart';

class ErrorPlaceholderWidget extends StatelessWidget {
  final String message;
  const ErrorPlaceholderWidget(this.message, {super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.s32),
        child: Text(
          ErrorMessageFactory.getMessage(context, message),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }


}
