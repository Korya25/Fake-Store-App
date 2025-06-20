
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';

class AuthFotterButtom extends StatelessWidget {
  const AuthFotterButtom({
    super.key, required this.title, this.onTap,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             GestureDetector(
               onTap:onTap,
               child: Text(
                 title,
                 style: AppTextStyle.descriptionText.copyWith(
                   color: AppColors.ordinaryText,
                 ),
               ),
             ),
             const SizedBox(width: 4),
             const Icon(
               Icons.arrow_right_alt,
               size: 24,
               color: AppColors.primary,
             ),
           ],
         );
  }
}
