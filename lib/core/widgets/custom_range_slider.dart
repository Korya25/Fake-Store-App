import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomRangeSlider extends StatelessWidget {
  final RangeValues values;
  final double min;
  final double max;
  final Function(RangeValues)? onChanged;
  final String? minLabel;
  final String? maxLabel;

  const CustomRangeSlider({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    this.onChanged,
    this.minLabel,
    this.maxLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: values,
          min: min,
          max: max,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.grey,
        ),
        if (minLabel != null && maxLabel != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  minLabel!,
                  style: AppTextStyle.descriptionText.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  maxLabel!,
                  style: AppTextStyle.descriptionText.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
