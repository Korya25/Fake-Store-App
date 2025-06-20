import 'package:dartz/dartz.dart';
import 'package:fake_store_app/features/auth/data/models/login_model.dart';
import 'package:fake_store_app/features/auth/data/models/sign_up_model.dart';
import 'package:fake_store_app/features/auth/data/models/user_model.dart';
import 'package:fake_store_app/core/api/api_consumer.dart';
import 'package:fake_store_app/core/api/end_point.dart';
import 'package:fake_store_app/core/cache/cache_helper.dart';
import 'package:fake_store_app/core/errors/exceptions.dart';

class UserRepo {
  final ApiConsumer apiConsumer;

  UserRepo({required this.apiConsumer});

  // Login
  Future<Either<String, LoginModel>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.login,
        data: {
          'username': username,
          'password': password,
        },
      );

      final loginModel = LoginModel.fromJson(response);
      await CacheHelper.saveData(key: 'token', value: loginModel.token);
      return Right(loginModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  // Sign Up
  Future<Either<String, SignUpModel>> signUp({
    required UserModel userModel,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.signUp,
        data: userModel.toJson(),
      );
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  // Get All Users
  Future<Either<String, List<UserModel>>> getAllUsers() async {
    try {
      final response = await apiConsumer.get(EndPoint.getAllUsers);
      final users = (response as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
      return Right(users);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  // Get User by ID
  Future<Either<String, UserModel>> getUserById(int userId) async {
    try {
      final response =
          await apiConsumer.get('${EndPoint.getUserById}/$userId');
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
