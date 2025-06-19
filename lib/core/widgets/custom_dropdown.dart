import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hint;
  final Function(T?)? onChanged;
  final String Function(T) itemText;

  const CustomDropdown({
    super.key,
    this.value,
    required this.items,
    required this.hint,
    this.onChanged,
    required this.itemText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey),
      ),
      child: DropdownButton<T>(
        value: value,
        hint: Text(
          hint,
          style: AppTextStyle.descriptiveItems.copyWith(
            color: AppColors.grey,
          ),
        ),
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: AppColors.dark,
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              itemText(item),
              style: AppTextStyle.descriptiveItems.copyWith(
                color: AppColors.ordinaryText,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
      ),
    );
  }
}
