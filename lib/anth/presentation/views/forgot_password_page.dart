import 'package:fake_store_app/anth/presentation/controller/user_cubit.dart';
import 'package:fake_store_app/anth/presentation/controller/user_state.dart';
import 'package:fake_store_app/anth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/anth/presentation/widgets/auth_app_bar.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
                const AuthAppBar(title: 'Forgot password'),
                const SizedBox(height: 32),
                BlocConsumer<UserCubit, UserState>(
                  listener: (context, state) {
                    if (state is ForgotPasswordSuccess) {
                      context.pushNamed(AppRoutes.login);
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is ForgotPasswordLoading;
                    final hasError = state is ForgotPasswordFailure;
                    final errorMessage = hasError ? (state as ForgotPasswordFailure).errorMessage : null;

                    return Column(
                      children: [
                        ForgotPasswordForm(
                          isLoading: isLoading,
                          onSubmit: (email) {
                            context.read<UserCubit>().forgotPassword(email: email);
                          },
                        ),
                        if (hasError)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              errorMessage ?? '',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
