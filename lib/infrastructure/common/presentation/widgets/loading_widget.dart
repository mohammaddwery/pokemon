import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final EdgeInsets padding;
  const LoadingWidget({
    super.key,
    this.padding=const EdgeInsets.all(8.0),
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.center,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}