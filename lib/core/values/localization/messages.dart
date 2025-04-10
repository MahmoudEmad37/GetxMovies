import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'langs/ar.dart';
import 'langs/en.dart';

class Messages extends Translations {
  static const fallbackLocale = Locale('en', 'US');
  static const supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
