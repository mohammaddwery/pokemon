import 'package:flutter/material.dart';
import '../helpers/error_message_factory.dart';
import '../styles/app_sizes.dart';

class ExtraListItemPlaceholder extends StatelessWidget {
  final String message;
  const ExtraListItemPlaceholder(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.s16),
        child: Text(
          ErrorMessageFactory.getMessage(context, message),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
