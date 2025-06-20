import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Or sign up with social account',
          style: AppTextStyle.descriptionText.copyWith(
            color: AppColors.ordinaryText,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              onTap: () {
                   _showTopToast();

              },
              child: Image.network(
                'https://developers.google.com/identity/images/g-logo.png',
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 16),
            _SocialButton(
              onTap: () {
                    _showTopToast();

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

void _showTopToast() {
  Fluttertoast.showToast(
    msg: "Soon...",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    backgroundColor:AppColors.primary,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
