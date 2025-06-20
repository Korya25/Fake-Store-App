import 'package:fake_store_app/features/presentation/widgets/sign_up_form.dart';
import 'package:fake_store_app/features/presentation/widgets/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/features/presentation/widgets/auth_app_bar.dart';
import 'package:go_router/go_router.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  void _onSignUp(BuildContext context, String name, String email, String password) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign up successful!')),
    );
    context.pushNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 50),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthAppBar(title: 'Sign up', showBackButton: false),
                      const SizedBox(height: 32),
                      SignUpForm(onSubmit: (name, email, password) => _onSignUp(context, name, email, password)),
                    ],
                  ),
                ),
              ),
              const SocialLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
