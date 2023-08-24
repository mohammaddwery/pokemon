import '../../../core/core/app_constants.dart';
import '../../../core/presentation/localization/locale_utils.dart';
import 'app_localization.dart';

final appLocalizationDelegate = AppLocalizationDelegate(
  getPathFunction: (locale) => getTranslationFilePath(locale: locale),
  supportedLocales: appSupportedLocales,
);
