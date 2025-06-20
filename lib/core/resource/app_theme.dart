import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
        displayLarge: AppTextStyle.headline,
        displayMedium: AppTextStyle.headline2,
        displaySmall: AppTextStyle.headlineSmall,
        headlineLarge: AppTextStyle.headlineSmall,
        headlineMedium: AppTextStyle.subheads,
        headlineSmall: AppTextStyle.text,
        titleLarge: AppTextStyle.text,
        titleMedium: AppTextStyle.descriptiveItems,
        titleSmall: AppTextStyle.descriptionText,
        bodyLarge: AppTextStyle.text,
        bodyMedium: AppTextStyle.descriptiveItems,
        bodySmall: AppTextStyle.descriptionText,
        labelLarge: AppTextStyle.descriptiveItems,
        labelMedium: AppTextStyle.descriptionText,
        labelSmall: AppTextStyle.helperText,
      );
}
