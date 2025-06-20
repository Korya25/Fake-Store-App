import 'package:fake_store_app/core/api/end_point.dart';

class SignUpModel {
  final int id;

  SignUpModel({required this.id});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(id: json[ApiKeys.id]);
  }

  Map<String, dynamic> toJson() {
    return {ApiKeys.id: id};
  }
}
