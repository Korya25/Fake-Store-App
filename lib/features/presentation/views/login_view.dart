import 'package:fake_store_app/features/presentation/widgets/auth_app_bar.dart';
import 'package:fake_store_app/features/presentation/widgets/login_form.dart';
import 'package:fake_store_app/features/presentation/widgets/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  void _onLogin(BuildContext context, String email, String password) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login successful!')),
    );
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
                      const AuthAppBar(title: 'Login'),
                      const SizedBox(height: 32),
                      LoginForm(onSubmit: (email, password) => _onLogin(context, email, password)),
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
