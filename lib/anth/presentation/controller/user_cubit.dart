import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/anth/data/models/user_model.dart';
import 'package:fake_store_app/anth/data/repositories/user_repo.dart';
import 'package:fake_store_app/anth/presentation/controller/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;

  UserCubit(this.userRepo) : super(UserInitial());

  // Login
  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    final response = await userRepo.signIn(
      username: username,
      password: password,
    );

    response.fold(
      (error) => emit(LoginFailure(error)),
      (loginModel) => emit(LoginSuccess(loginModel.token)),
    );
  }

  // SignUp
  Future<void> signUp({required UserModel userModel}) async {
  emit(SignUpLoading());

  final response = await userRepo.signUp(userModel: userModel);

  response.fold(
    (error) => emit(SignUpFailure(error)),
    (signUpModel) => emit(SignUpSuccess(signUpModel.id)),
  );
}

  // Get All Users
  Future<void> getAllUsers() async {
    emit(GetAllUsersLoading());

    final response = await userRepo.getAllUsers();

    response.fold(
      (error) => emit(GetAllUsersFailure(error)),
      (usersList) => emit(GetAllUsersSuccess(usersList)),
    );
  }

  // Get Single User
  Future<void> getSingleUser(int userId) async {
    emit(GetSingleUserLoading());

    final response = await userRepo.getUserById(userId);

    response.fold(
      (error) => emit(GetSingleUserFailure(error)),
      (userModel) => emit(GetSingleUserSuccess(userModel)),
    );
  }

  Future<void> forgotPassword({required String email}) async {
  emit(ForgotPasswordLoading());

  try {
    // Api Call
    await Future.delayed(const Duration(seconds: 2));
    emit(ForgotPasswordSuccess());
  } catch (e) {
    emit(ForgotPasswordFailure("Failed to send reset link."));
  }
}
void reset() {
  emit(UserInitial());
}


}
