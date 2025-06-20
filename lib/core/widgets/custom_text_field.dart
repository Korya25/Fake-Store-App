import 'package:flutter/material.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
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
  final String? Function(String?)? validator;

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
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: AppColors.grey,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enabled,
      style: AppTextStyle.descriptiveItems.copyWith(
        color: AppColors.ordinaryText,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        labelText: labelText,
        labelStyle:
            AppTextStyle.descriptiveItems.copyWith(color: AppColors.grey),
        hintText: hintText,
        hintStyle:
            AppTextStyle.descriptiveItems.copyWith(color: AppColors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        filled: true,
        fillColor: AppColors.dark,
        errorText: hasError ? errorText : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
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
