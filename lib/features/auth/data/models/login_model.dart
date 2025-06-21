import 'package:fake_store_app/core/api/end_point.dart';

class LoginModel {
  final String token;

  LoginModel({required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(token: json[ApiKeys.token]);
  }

  Map<String, dynamic> toJson() {
    return {ApiKeys.token: token};
  }
}
