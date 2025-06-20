import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/features/auth/presentation/views/forgot_password_page.dart';
import 'package:fake_store_app/features/auth/presentation/views/login_view.dart';
import 'package:fake_store_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:fake_store_app/features/home/presentation/views/category_view.dart';
import 'package:fake_store_app/features/home/presentation/views/chart_view.dart';
import 'package:fake_store_app/features/home/presentation/views/favorites_view.dart';
import 'package:fake_store_app/features/home/presentation/views/home_view.dart';
import 'package:fake_store_app/features/home/presentation/views/product_details_view.dart';
import 'package:fake_store_app/features/home/presentation/views/profile_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.category,
        name: AppRoutes.category,
        builder: (context, state) => CategoryView(
          category: state.uri.queryParameters['category'] ?? '',
        ),
      ),
      GoRoute(
        path: AppRoutes.productDetails,
        name: AppRoutes.productDetails,
        builder: (context, state) => ProductDetailsView(
          productId: state.uri.queryParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: AppRoutes.cart,
        name: AppRoutes.cart,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AppRoutes.favorites,
        name: AppRoutes.favorites,
        builder: (context, state) => const FavoritesView(),
      ),
    ],
  );
}

