import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/navigator/home_navigator.dart';
import '../../../../../infrastructure/common/presentation/helpers/app_images.dart';
import '../../../../../infrastructure/common/presentation/widgets/image_widget.dart';
import '../../../../../infrastructure/core/injection/app_injector.dart';
import '../../../../../infrastructure/core/presentation/widgets/app_base_widget_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseWidgetState<SplashScreen> {

  final homeNavigator = AppInjector.I.get<HomeNavigator>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),() {
      homeNavigator.navigateToHome(context);
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
