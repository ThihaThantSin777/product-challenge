import 'package:flutter/material.dart';
import 'package:product_app_challenge/bloc/locale_provider/locale_provider.dart';
import 'package:product_app_challenge/utils/colors.dart';
import 'package:product_app_challenge/utils/image_utils.dart';
import 'package:product_app_challenge/utils/strings.dart';
import 'package:provider/provider.dart';

class LanguageSwitcherWidget extends StatefulWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  State<LanguageSwitcherWidget> createState() => _LanguageSwitcherWidgetState();
}

class _LanguageSwitcherWidgetState extends State<LanguageSwitcherWidget> {
  bool isEnglish = false;

  @override
  void initState() {
    final provider = context.read<LocaleProvider>();
    isEnglish = provider.locale == const Locale(kEnglishLocalizationCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LocaleProvider>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ImageUtils.kThaiFlag,
          width: 40,
          height: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        Switch(
            activeColor: ProductColors.kPrimaryColor,
            value: isEnglish,
            onChanged: (value) {
              if (mounted) {
                setState(() {
                  provider.setLocale(
                    Locale(isEnglish ? kThaiLocalizationCode : kEnglishLocalizationCode),
                  );
                  isEnglish = provider.locale == const Locale(kEnglishLocalizationCode);
                });
              }
            }),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          ImageUtils.kEnglishFlag,
          width: 40,
          height: 40,
        ),
      ],
    );
  }
}
