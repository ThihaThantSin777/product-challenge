import 'package:flutter/material.dart';
import 'package:product_app_challenge/utils/strings.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale(kEnglishLocalizationCode, '');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale(kEnglishLocalizationCode, ''),
    const Locale(kThaiLocalizationCode, ''),
  ];
}
