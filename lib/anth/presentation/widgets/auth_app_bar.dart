import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';

class AuthAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final bool showBackButton;

  const AuthAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showBackButton,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.ordinaryText),
            onPressed: onBack ?? () => Navigator.pop(context),
            splashRadius: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyle.headline
          ,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
