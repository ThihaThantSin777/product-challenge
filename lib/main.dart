import 'package:flutter/material.dart';
import 'package:product_app_challenge/pages/category_home_page.dart';
import 'package:product_app_challenge/utils/colors.dart';
import 'package:product_app_challenge/utils/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      locale: const Locale(
        kEnglishLocalizationCode,
      ),
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
