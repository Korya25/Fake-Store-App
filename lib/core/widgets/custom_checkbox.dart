import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final String? label;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          checkColor: AppColors.white,
          side: const BorderSide(color: AppColors.grey),
        ),
        if (label != null) ...[
          const SizedBox(width: 8),
          Text(
            label!,
            style: AppTextStyle.descriptiveItems.copyWith(
              color: AppColors.ordinaryText,
            ),
          ),
        ],
      ],
    );
  }
}