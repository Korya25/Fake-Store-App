import 'package:flutter/material.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final bool hasError;
  final bool isValid;
  final bool showIconOnly;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool enabled;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    this.hasError = false,
    this.isValid = false,
    this.showIconOnly = false,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: showIconOnly ? (_) => null : validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enabled,
      cursorColor: AppColors.grey,
      style: AppTextStyle.descriptiveItems.copyWith(
        color: AppColors.ordinaryText,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        labelText: labelText,
        labelStyle: AppTextStyle.descriptiveItems.copyWith(color: AppColors.grey),
        suffixIcon: _buildSuffixIcon(),
        filled: true,
        fillColor: AppColors.dark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // No errorText shown when showIconOnly = true
        errorText: showIconOnly ? null : (hasError ? ' ' : null),
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
