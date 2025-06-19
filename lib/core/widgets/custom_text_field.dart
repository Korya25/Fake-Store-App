import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool hasError;
  final String? errorText;
  final bool isValid;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.hasError = false,
    this.errorText,
    this.isValid = false,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: AppTextStyle.descriptionText.copyWith(
              color: AppColors.ordinaryText,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          enabled: enabled,
          style: AppTextStyle.descriptiveItems,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyle.descriptiveItems.copyWith(
              color: AppColors.grey,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: _buildSuffixIcon(),
            filled: true,
            fillColor: AppColors.dark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? AppColors.error
                    : isValid
                        ? AppColors.success
                        : AppColors.grey,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? AppColors.error
                    : isValid
                        ? AppColors.success
                        : AppColors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? AppColors.error
                    : isValid
                        ? AppColors.success
                        : AppColors.primary,
                width: 2,
              ),
            ),
          ),
        ),
        if (hasError && errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: AppTextStyle.helperText.copyWith(
              color: AppColors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (hasError) {
      return const Icon(Icons.close, color: AppColors.error);
    } else if (isValid) {
      return const Icon(Icons.check, color: AppColors.success);
    }
    return suffixIcon;
  }
}

