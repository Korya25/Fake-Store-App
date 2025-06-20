import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomStatusBar extends StatelessWidget {
  final bool isDark;

  const CustomStatusBar({
    super.key,
    this.isDark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: isDark ? AppColors.background : AppColors.white,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '9:41',
                style: AppTextStyle.descriptionText.copyWith(
                  color: isDark ? AppColors.white : AppColors.dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.signal_cellular_4_bar,
                    size: 16,
                    color: isDark ? AppColors.white : AppColors.dark,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.wifi,
                    size: 16,
                    color: isDark ? AppColors.white : AppColors.dark,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.battery_full,
                    size: 16,
                    color: isDark ? AppColors.white : AppColors.dark,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
