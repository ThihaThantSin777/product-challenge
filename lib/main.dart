import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:product_app_challenge/bloc/locale_provider/locale_provider.dart';
import 'package:product_app_challenge/locale/app_localization_delegate.dart';
import 'package:product_app_challenge/pages/category_home_page.dart';
import 'package:product_app_challenge/utils/colors.dart';
import 'package:product_app_challenge/utils/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(),
      child: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        )
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocaleProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      locale: provider.locale,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(kEnglishLocalizationCode, ''),
        Locale(kThaiLocalizationCode, ''),
        // Add other locales your app supports
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: ProductColors.kMainBodyColor,
        appBarTheme: const AppBarTheme(
          color: ProductColors.kMainBodyColor,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const CategoryHomePage(),
    );
  }
}
