import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final List<Color> colors;
  final Color? selectedColor;
  final Function(Color)? onColorSelected;

  const ColorPicker({
    super.key,
    required this.colors,
    this.selectedColor,
    this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        final isSelected = selectedColor == color;
        return GestureDetector(
          onTap: () => onColorSelected?.call(color),
          child: Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: AppColors.white, width: 2)
                  : null,
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 16,
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }
}
