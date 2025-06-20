import 'package:fake_store_app/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:fake_store_app/core/widgets/custom_visibility_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:fake_store_app/features/auth/presentation/controller/user_cubit.dart';
import 'package:fake_store_app/features/auth/presentation/controller/user_state.dart';
import 'package:fake_store_app/features/auth/data/models/user_model.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                    const AuthAppBar(title: 'Sign up', showBackButton: false),
                    const SizedBox(height: 32),
                    BlocConsumer<UserCubit, UserState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          context.pushNamed(AppRoutes.login);
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is SignUpLoading;
                        final hasError = state is SignUpFailure;
                        final errorMessage = hasError ? (state).errorMessage : null;
        
                        return Column(
                          children: [
                            SignUpForm(
                              isLoading: isLoading,
                              onSubmit: (name, email, password) {
                                final userModel = UserModel(
                                  name: UserName(firstname: name, lastname: ""),
                                  email: email,
                                  password: password,
                                  username: email.split('@').first,
                                  address: UserAddress(
                                    city: 'Cairo',
                                    street: "123 Main St",
                                    number: 10,
                                    zipcode: "12345",
                                    geolocation: GeoLocation(lat: "0.0", long: "0.0"),
                                  ),
                                  phone: '01000000000',
                                );
        
                                context.read<UserCubit>().signUp(userModel: userModel);
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
                    const SizedBox(height: 24),
                    const SocialLoginButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
