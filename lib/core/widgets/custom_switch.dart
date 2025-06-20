import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.success,
      inactiveTrackColor: AppColors.grey,
      inactiveThumbColor: AppColors.white,
    );
  }
}
