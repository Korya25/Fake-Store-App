import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLarge;
  final Widget? icon;

  const OutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLarge = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isLarge ? double.infinity : null,
      height: isLarge ? 48 : 36,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ordinaryText,
          side: const BorderSide(color: AppColors.grey, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isLarge ? 25 : 18),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isLarge ? 24 : 16,
            vertical: isLarge ? 12 : 8,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
                      color: AppColors.ordinaryText,
                    )
                  : AppTextStyle.descriptionText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.ordinaryText,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}