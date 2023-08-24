import 'package:flutter/material.dart';
import '../../../../../infrastructure/common/presentation/helpers/app_images.dart';
import '../../../../../infrastructure/common/presentation/widgets/image_widget.dart';
import '../../../../../infrastructure/core/presentation/widgets/app_base_widget_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseWidgetState<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),() {
      // TODO: navigate to home screen
    });
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: ImageWidget(
          url: AppImages.flutterLogo,
          fit: BoxFit.contain,
          width: width* .3,
          height: width* .3,
        ),
    );
  }
}
