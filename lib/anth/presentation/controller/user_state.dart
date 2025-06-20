import 'package:fake_store_app/anth/data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class LoginLoading extends UserState {}
class LoginSuccess extends UserState {
  final String token;
  LoginSuccess(this.token);
}
class LoginFailure extends UserState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class SignUpLoading extends UserState {}
class SignUpSuccess extends UserState {
  final int userId;
  SignUpSuccess(this.userId);
}
class SignUpFailure extends UserState {
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}

class GetAllUsersLoading extends UserState {}
class GetAllUsersSuccess extends UserState {
  final List<UserModel> users;
  GetAllUsersSuccess(this.users);
}
class GetAllUsersFailure extends UserState {
  final String errorMessage;
  GetAllUsersFailure(this.errorMessage);
}

class GetSingleUserLoading extends UserState {}
class GetSingleUserSuccess extends UserState {
  final UserModel user;
  GetSingleUserSuccess(this.user);
}
class GetSingleUserFailure extends UserState {
  final String errorMessage;
  GetSingleUserFailure(this.errorMessage);
}
