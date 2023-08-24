import 'package:flutter/material.dart';

String getTranslationFilePath({
  required Locale locale,
}) => 'assets/subtitles/${locale.languageCode}.json';
