import 'package:flutter/widgets.dart';
import '../../../core/presentation/localization/localization.dart';
import '../../../core/presentation/localization/resolution_callback.dart';

class AppLocalization extends BaseLocalization {
  AppLocalization({
    required this.appLocale,
    required this.appPathFunction,
  }) : super(appPathFunction: appPathFunction, locale: appLocale);
  @override
  // ignore: overridden_fields
  final String Function(Locale locale) appPathFunction;
  final Locale appLocale;
  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  AppLocalizationDelegate({
    required this.supportedLocales,
    required this.getPathFunction,
  });

  final List<Locale> supportedLocales;
  final String Function(Locale locale) getPathFunction;
  late Locale locale;

  @override
  bool isSupported(Locale locale) =>
      getSupportedLocaleForLanguageCode(supportedLocales, locale) != null;

  @override
  Future<AppLocalization> load(Locale locale) async {
    this.locale = locale;
    final localization = AppLocalization(
      appLocale: locale,
      appPathFunction: getPathFunction,
    );

    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => old.locale != locale;
}
