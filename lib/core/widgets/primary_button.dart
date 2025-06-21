import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLarge;
  final bool isLoading;
  final Widget? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLarge = true,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = isLoading || onPressed == null;

    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        width: isLarge ? double.infinity : null,
        height: isLarge ? 48 : 36,
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 24 : 16,
          vertical: isLarge ? 12 : 8,
        ),
        decoration: BoxDecoration(
          color: isDisabled ? AppColors.primary : AppColors.primary,
          borderRadius: BorderRadius.circular(isLarge ? 25 : 18),
         
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      icon!,
                      const SizedBox(width: 8),
                    ],
                    Text(
                      text,
                      style: isLarge
                          ? AppTextStyle.descriptiveItems.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            )
                          : AppTextStyle.descriptionText.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
