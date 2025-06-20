import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Or sign up with social account text
        Text(
          'Or sign up with social account',
          style: AppTextStyle.descriptionText.copyWith(
            color: AppColors.ordinaryText,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Social buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google Button
            _SocialButton(
              onTap: () {
                // Handle Google login
              },
              child: Image.network(
                'https://developers.google.com/identity/images/g-logo.png',
                width: 24,
                height: 24,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Facebook Button
            _SocialButton(
              onTap: () {
                // Handle Facebook login
              },
              child: const Icon(
                Icons.facebook,
                color: Color(0xff4267B2),
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _SocialButton({
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 92,
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(child: child),
      ),
    );
  }
}
