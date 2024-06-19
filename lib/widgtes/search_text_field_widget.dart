import 'package:flutter/material.dart';
import 'package:product_app_challenge/utils/colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.hintText,
    required this.onChangedText,
    required this.onSubmittedText,
  });

  final String hintText;
  final Function(String) onChangedText;
  final Function(String) onSubmittedText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangedText,
      onSubmitted: onSubmittedText,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(
          Icons.search,
          color: ProductColors.kPrimaryColor,
        ),
      ),
    );
  }
}
