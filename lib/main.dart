import 'package:fake_store_app/core/cache/cache_helper.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_router.dart';
import 'package:flutter/material.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});class SignUpResponse {
  final int id;

  SignUpResponse({required this.id});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}