import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/features/presentation/views/forgot_password_page.dart';
import 'package:fake_store_app/features/presentation/views/login_view.dart';
import 'package:fake_store_app/features/presentation/views/sign_up_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.signUp,
    routes: [
      GoRoute(
        path: AppRoutes.signUp,
        name:  AppRoutes.signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name:  AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name:  AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
    
  );
}