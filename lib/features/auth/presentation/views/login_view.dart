import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/widgets/custom_visibility_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/login_form.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/features/auth/presentation/controller/user_cubit.dart';
import 'package:fake_store_app/features/auth/presentation/controller/user_state.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthAppBar(title: 'Login'),
                const SizedBox(height: 32),
    
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    final isLoading = state is LoginLoading;
                    final hasError = state is LoginFailure;
                    final errorMessage = hasError ? (state).errorMessage : null;
    
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginForm(
                          isLoading: isLoading,
                          onSubmit: (username, password) {
                            context.read<UserCubit>().login(
                              username: username,
                              password: password,
                            );
    context.goNamed(AppRoutes.home);
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
    
                const SizedBox(height: 20),
                const SocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
