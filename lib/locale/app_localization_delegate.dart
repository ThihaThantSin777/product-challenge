import 'package:flutter/material.dart';

import 'locale_en.dart';
import 'locale_th.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get homeTitle {
    switch (locale.languageCode) {
      case 'en':
        return LocaleEn.values['homeTitle']!;
      case 'th':
        return LocaleTh.values['homeTitle']!;
      default:
        return LocaleEn.values['homeTitle']!;
    }
  }

  String get categorySearchHintText {
    switch (locale.languageCode) {
      case 'en':
        return LocaleEn.values['categorySearchHintText']!;
      case 'th':
        return LocaleTh.values['categorySearchHintText']!;
      default:
        return LocaleEn.values['categorySearchHintText']!;
    }
  }

  String get productSearchHintText {
    switch (locale.languageCode) {
      case 'en':
        return LocaleEn.values['productSearchHintText']!;
      case 'th':
        return LocaleTh.values['productSearchHintText']!;
      default:
        return LocaleEn.values['productSearchHintText']!;
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'th'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
