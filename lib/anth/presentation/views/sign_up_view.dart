import 'package:fake_store_app/anth/presentation/widgets/sign_up_form.dart';
import 'package:fake_store_app/anth/presentation/widgets/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/anth/presentation/widgets/auth_app_bar.dart';
import 'package:fake_store_app/anth/presentation/controller/user_cubit.dart';
import 'package:fake_store_app/anth/presentation/controller/user_state.dart';
import 'package:fake_store_app/anth/data/models/user_model.dart';
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
                            context.read<UserCubit>().signUp(
                                  userModel: UserModel(
                                    name:UserName(firstname: 'Korya', lastname: 'Doe'),
                                    email: 'john@gmail.com',
                                    password: 'm38rmF\$',
                                     username: 'johnd',
                                      address:UserAddress(city: 'kilcoole', street:  "7835 new road", number: 3, zipcode: "12926-3874", geolocation:GeoLocation(lat: "-37.3159", long: "81.1496")),
                                       phone: '1-570-236-7033',
                                  ),
                                );
                                context.goNamed(AppRoutes.login);
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
                const SizedBox(height: 24),
                const SizedBox(height: 32),
                const SocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
