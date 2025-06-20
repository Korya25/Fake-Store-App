import 'package:fake_store_app/anth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/anth/presentation/widgets/auth_app_bar.dart';
import 'package:go_router/go_router.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  void _handleSubmit(BuildContext context, String email) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link sent to your email'),
        backgroundColor: AppColors.success,
      ),
    );
    context.pushNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthAppBar(title: 'Forgot password'),
                const SizedBox(height: 32),
                ForgotPasswordForm(onSubmit: (email) => _handleSubmit(context, email)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
