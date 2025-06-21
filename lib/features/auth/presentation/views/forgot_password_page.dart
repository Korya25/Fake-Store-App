import 'package:fake_store_app/features/auth/presentation/controller/user_cubit.dart';
import 'package:fake_store_app/features/auth/presentation/controller/user_state.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/forgot_password_form.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:fake_store_app/core/widgets/custom_visibility_widget.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/auth_app_bar.dart';
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
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const SuccessDialog(),
  );
}

                  },
                  builder: (context, state) {
                    final isLoading = state is ForgotPasswordLoading;
                    final hasError = state is ForgotPasswordFailure;
                    final errorMessage = hasError ? (state).errorMessage : null;

                    return Column(
                      children: [
                        ForgotPasswordForm(
                          isLoading: isLoading,
                          onSubmit: (email) {
                            context.read<UserCubit>().forgotPassword(email: email);
                          },
                        ),
                                        const SizedBox(height: 20),

                        Center(
                          child: CustomVisibilityWidget(
                            visible: hasError,
                            widget: Text(
                                errorMessage ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 16),
             Text(
              'Success!',
              style: AppTextStyle.headlineSmall,
            ),
            const SizedBox(height: 8),
             Text(
              'Password reset link sent to your email.',
              textAlign: TextAlign.center,
              style: AppTextStyle.descriptiveItems,

            ),
            const SizedBox(height: 24),
          
           PrimaryButton(
            onPressed: (){
               Navigator.pop(context);
                context.goNamed(AppRoutes.login);
            },
            isLarge: false,
            text:'Back to Login' ),
          ],
        ),
      ),
    );
  }
}
