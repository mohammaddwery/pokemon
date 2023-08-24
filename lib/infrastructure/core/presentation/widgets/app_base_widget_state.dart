import 'package:flutter/material.dart';
import '../../../common/presentation/localization/app_localization.dart';

abstract class BaseWidgetState<ScreenWidget extends StatefulWidget>
    extends State<ScreenWidget>
    with WidgetsBindingObserver {

  late double width;
  late double height;
  late MediaQueryData mediaQuery;
  late TextTheme textTheme;
  late ThemeData themeData;
  late AppLocalization appLocal;
  late String lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      mediaQuery = MediaQuery.of(context);
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
      themeData = Theme.of(context);
      textTheme = themeData.textTheme;
      appLocal = AppLocalization.of(context);
      lang = appLocal.locale.languageCode;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(onWidgetStarted);
    super.initState();
  }

  onWidgetStarted(timeStamp) {}

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  Widget buildContent(BuildContext context);
}
