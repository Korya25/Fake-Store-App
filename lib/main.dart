import 'package:fake_store_app/features/auth/data/repositories/user_repo.dart';
import 'package:fake_store_app/features/auth/presentation/controller/user_cubit.dart';
import 'package:fake_store_app/core/api/dio_consumer.dart';
import 'package:fake_store_app/core/cache/cache_helper.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_router.dart';
import 'package:fake_store_app/features/home/data/repo/product_repo.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
            BlocProvider(create:   (context) => UserCubit(UserRepo(apiConsumer:DioConsumer()))),
            BlocProvider(create:   (context) =>ProductCubit(ProductRepo(api: DioConsumer()))..getAllProducts(),)

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.ordinaryText),
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}