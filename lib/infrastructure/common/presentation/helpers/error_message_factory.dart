import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/helpers/app_subtitles_keys.dart';
import '../localization/app_localization.dart';

class ErrorMessageFactory {
  static String getMessage(BuildContext context, String message) {
    final appLocal = AppLocalization.of(context);
    switch(message) {
      case AppSubtitlesKeys.generalErrorMessageKey:
      case AppSubtitlesKeys.connectionErrorMessageKey:
      case AppSubtitlesKeys.timeoutMessageKey:
        return appLocal.translate(message);

      default: return message;
    }
  }
}